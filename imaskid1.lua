local UserInputService = game:GetService('UserInputService');
local ContextActionService = game:GetService('ContextActionService');
local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value;

return function()

    local keyboard = {
        W = 0, A = 0, S = 0, D = 0,
        E = 0, Q = 0,
        Up = 0, Down = 0,
        LeftShift = 0,
    }

    local mouseDelta = Vector2.zero

    local navSpeed = 1

    local NAV_KEYBOARD_SPEED = Vector3.new(1,1,1)
    local PAN_MOUSE_SPEED = Vector2.new(1,1)*(math.pi/64)
    local NAV_ADJ_SPEED = 0.75
    local NAV_SHIFT_MUL = 0.25

    local function Vel(dt)
        navSpeed = math.clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

        local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)

        return Vector3.new(
            keyboard.D - keyboard.A,
            keyboard.E - keyboard.Q,
            keyboard.S - keyboard.W
        ) * NAV_KEYBOARD_SPEED * (navSpeed * (shift and NAV_SHIFT_MUL or 1))
    end

    local function Pan()
        local delta = mouseDelta
        mouseDelta = Vector2.zero
        return delta * PAN_MOUSE_SPEED
    end

    local function Keypress(_, state, input)
        keyboard[input.KeyCode.Name] = (state == Enum.UserInputState.Begin) and 1 or 0
        return Enum.ContextActionResult.Sink
    end

    local function MousePan(_, _, input)
        local d = input.Delta
        mouseDelta = Vector2.new(-d.y, -d.x)
        return Enum.ContextActionResult.Sink
    end

    local function Zero(t)
        for k,v in pairs(t) do
            t[k] = v*0
        end
    end

    local function StartCapture()
        ContextActionService:BindActionAtPriority(
            "FreecamKeyboard",
            Keypress,
            false,
            INPUT_PRIORITY,
            Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D,
            Enum.KeyCode.E, Enum.KeyCode.Q,
            Enum.KeyCode.Up, Enum.KeyCode.Down
        )

        ContextActionService:BindActionAtPriority(
            "FreecamMousePan",
            MousePan,
            false,
            INPUT_PRIORITY,
            Enum.UserInputType.MouseMovement
        )
    end

    local function StopCapture()
        navSpeed = 1
        Zero(keyboard)
        mouseDelta = Vector2.zero

        ContextActionService:UnbindAction("FreecamKeyboard")
        ContextActionService:UnbindAction("FreecamMousePan")
    end

    return {
        Vel = Vel,
        Pan = Pan,
        StartCapture = StartCapture,
        StopCapture = StopCapture
    }

end
