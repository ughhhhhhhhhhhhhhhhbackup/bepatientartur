if isfile("stuffnstuff/streamermode.txt") then
    if game.PlaceId == 2008032602 then
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
                MemberName.Text = '.gg/asu';
            end;
        end;
        
        for _, v in CurrentList:GetChildren() do
            Process(v);
        end;
        
        Invite:GetPropertyChangedSignal('Visible'):Connect(function()
            if Invite.Visible then
                Invite:FindFirstChild('From').Text = '.gg/asu';
            end;
        end);
    end;
end;
queue_on_teleport([[
  loadstring(game:HttpGet('https://raw.githubusercontent.com/ughhhhhhhhhhhhhhhhbackup/bepatientartur/refs/heads/main/loader.lua'))();
]])

loadstring(game:HttpGet('https://raw.githubusercontent.com/ughhhhhhhhhhhhhhhhbackup/bepatientartur/refs/heads/main/main.lua'))();
