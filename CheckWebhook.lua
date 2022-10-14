repeat wait() until game:IsLoaded()
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat wait()
    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
		if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
			if string.find(getgenv().ChooseTeam, "Pirate") then
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
					v.Function()
				end 
			elseif string.find(getgenv().ChooseTeam, "Marine")  then
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do
					v.Function()
				end 
			else
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
					v.Function()
				end 
			end
		end 
    end
until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/me-may-beo-hub/main/CheckProfile.lua"))()
