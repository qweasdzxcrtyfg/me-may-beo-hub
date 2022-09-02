--improve auto beli
------------------------------------------ Wait Path ----------------------------------------------
repeat wait() until game:IsLoaded()
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
if getgenv().PlayerFillter then
    if not table.find(getgenv().PlayersName,game.Players.LocalPlayer.Name) then
        return;
    end
end
------------------------------------------ Join Team Function ----------------------------------------------
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
------------------------------------------ Hop Server Function ----------------------------------------------
local foundedserver_hopping = false
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
        if tonumber(v.playing) >= tonumber(8) and tonumber(v.maxPlayers) > tonumber(v.playing) then
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
                if foundedserver_hopping == false then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        foundedserver_hopping == true
                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                elseif foundedserver_hopping == true then
                    table.insert(AllIDs, ID)
                    wait(5)
                    pcall(function()
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
------------------------------------------ Auto Beli Function ----------------------------------------------
spawn(function()
    while wait() do
        if getgenv().AutoBeli then
            chestleft = 0
            for i,v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name,"Chest") then
                    chestleft = chestleft + 1
                end
            end
            if chestleft > 0 then
                print(chestleft)
                pcall(function()
                    if not game.Players.LocalPlayer.Character:FindFirstChild("Head") then
                        for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                            if string.find(v.Name, "Chest") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                            end
                        end
                    else
                        game.Players.LocalPlayer.Character.Head:Destroy()
                    end
                end)
            elseif chestleft <= 0 then
                Teleport()
                wait(30)
            end
        end
    end
end)
if getgenv().WhiteScreen then
    local RunService = game:GetService("RunService")
    RunService:Set3dRenderingEnabled(false) --false thi la trang sat, true thi disable
end
