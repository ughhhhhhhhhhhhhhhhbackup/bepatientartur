if game.PlaceId == 2008032602 then --//  isfile("stuffnstuff/streamermode.txt")
    if isfile("stuffnstuff/streamermode.txt") then
        --// ranked lobby streamer mode
        local Players = game:GetService("Players");
        local Player = Players.LocalPlayer;
        local PlayerGui = Player.PlayerGui;
        
        local LobbyGui = PlayerGui:WaitForChild('LobbyGui');
        local Invite = LobbyGui:WaitForChild('Invite');
        local Party = LobbyGui:WaitForChild('Party');
        local CurrentList = Party:WaitForChild('CurrentList');
        
        local function Process(Frame)
            if Frame:IsA('Frame') and Frame:WaitForChild('MemberName') then
                local MemberName = Frame:WaitForChild('MemberName');
                MemberName.Text = '.gg/cWh43mFDms';
            end;
        end;
        
        for _, v in CurrentList:GetChildren() do
            Process(v);
        end;

        CurrentList.ChildAdded:Connect(Process);
        
        Invite:GetPropertyChangedSignal('Visible'):Connect(function()
            if Invite.Visible then
                Invite:FindFirstChild('From').Text = '.gg/cWh43mFDms';
            end;
        end);
    end;
end;
queue_on_teleport([[
  loadstring(game:HttpGet('https://raw.githubusercontent.com/ughhhhhhhhhhhhhhhhbackup/bepatientartur/refs/heads/main/loader.lua'))();
]])

if game.PlaceId == 1458767429 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ughhhhhhhhhhhhhhhhbackup/bepatientartur/refs/heads/main/main.lua'))();
end;
