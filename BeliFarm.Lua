if not getgenv().SelectTeam then 
    getgenv().SelectTeam = "Marine"
end
if not getgenv().PlayersName then return; end
repeat wait() until game:IsLoaded()
if not game:IsLoaded() then game.Loaded:Wait() end
	repeat wait() until game.Players
	repeat wait() until game.Players.LocalPlayer

if not table.find(getgenv().PlayersName, game.Players.LocalPlayer.Name) then return; end

	repeat wait() until game.ReplicatedStorage
	repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
	repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
	repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");


	repeat wait()
		if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
			if string.find(getgenv().SelectTeam, "Pirate") then
                for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
                    v.Function()
                end
			elseif string.find(getgenv().SelectTeam, "Marine")  then
                for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
                    v.Function()
                end
			else
                for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
                    v.Function()
                end
			end
		end
	until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() 

local plr = game.Players.LocalPlayer
function hop()
    founded_server_to_hop = false
    print('im hopping')
    local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) and tonumber(v.playing) >= tonumber(8) then
            print('finding setfenv')
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                if founded_server_to_hop == false then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        founded_server_to_hop = true
                        print('founded sv')
                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end
Teleport()
end
spawn(function()
    while wait() do
        if getgenv().Farm then
            pcall(function()
                if not plr.Character:FindFirstChild("Head") then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if string.find(v.Name, "Chest") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        end
                        if not game:GetService("Workspace"):FindFirstChild("Chest1") or not game:GetService("Workspace"):FindFirstChild("Chest2") or not game:GetService("Workspace"):FindFirstChild("Chest3") then
                            print('game dau cac')
                            hop()
                            wait(30)
                        end
                    end
                else
                    plr.Character.Head:Destroy()
                end
            end)
        elseif getgenv().Farm == false then
            print('farm == false')
        end
    end
end)
if getgenv().WhiteScreen then
    local RunService = game:GetService("RunService")
    RunService:Set3dRenderingEnabled(false) --false thi la trang sat, true thi disable
end
