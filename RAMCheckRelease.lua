repeat wait() until game:IsLoaded()
repeat wait() until game.Players
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
repeat wait() until game:GetService("Players").LocalPlayer:FindFirstChild("DataLoaded")
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
wait(1)
function CheckDevilFruit()
    local mmb1 = "Devil Fruit: Nothing"
    local toreturn2 = ""
    if game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == "" then
        mmb1 = "Devil Fruit: Nothing"
    else
        function checkmasterydf()
            mas = 0
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                    mas = v.Level.Value
                end
            end
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                    mas = v.Level.Value
                end
            end
            return mas;
        end
        mmb1 = "Fruit: "..tostring(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.." | Mastery: "..checkmasterydf().." | ")
        df = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
        Raids = require(game:GetService("ReplicatedStorage").Raids).raids
        AdvancedRaids = require(game:GetService("ReplicatedStorage").Raids).advancedRaids
        Raids2 = {}
        for i,v in pairs(Raids) do
            table.insert(Raids2,v)
        end
        for i,v in pairs(AdvancedRaids) do
            table.insert(Raids2,v)
        end
        function khongngu22(name)
            string22 = name:split("-")
            return string22[2]
        end
        if table.find(Raids2,khongngu22(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)) then
            Awaked = {}
            for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")) do
                if not Awaked[i] then Awaked[i] = {["Awakened"] = v["Awakened"]} end
            end
            toreturn2 = "Awaked Skills: "
            New2 = {}
            for i,v in next, Awaked do
                if v["Awakened"] == true then
                    New2[i] = i..", "
                end
            end
            for i,v in next, New2 do
                toreturn2 = toreturn2..v
            end
        else
            mmb1 = mmb1.."Cant Awake."
        end
    end
    return mmb1..""..toreturn2;
end 
function CheckItem(itemcc)
    cac = false
    for k,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v.Name == itemcc then 
            return true;
        end
    end
    return cac;
end
function GetListWeapon(Rarity)
    khongngu33 = ""
    for k,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v["Rarity"] >= Rarity and v["Type"] ~= "Material" and v["Type"] ~= "Blox Fruit" then
            khongngu33 = khongngu33..v["Name"]..", "
        end
    end
    return khongngu33;
end
function MeleeCount()
    meleecoss = 0
    meleetable = {"DragonTalon","Superhuman","Godhuman","ElectricClaw","SharkmanKarate", "DeathStep",}
    for i,v in pairs(meleetable) do
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buy"..v,true) == 1 then
            meleecoss = meleecoss + 1
        end
    end
    return meleecoss;
end
function getInventoryFruits(Rarity)
    khongngu44 = ""
    for k,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v["Rarity"] >= Rarity and v["Type"] == "Blox Fruit" then
            khongngu44 = khongngu44..v["Name"]..", "
        end
    end
    return khongngu44;
end
function isfullskill()
    ff = false
    Raids = require(game:GetService("ReplicatedStorage").Raids).raids
    AdvancedRaids = require(game:GetService("ReplicatedStorage").Raids).advancedRaids
    Raids2 = {}
    for i,v in pairs(Raids) do
        table.insert(Raids2,v)
    end
    for i,v in pairs(AdvancedRaids) do
        table.insert(Raids2,v)
    end
    function khongngu22(name)
        string22 = name:split("-")
        return string22[2]
    end
    if table.find(Raids2,khongngu22(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)) then
        Awaked = {}
        c = 0
        d = 0
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")) do
            if not Awaked[i] then Awaked[i] = {["Awakened"] = v["Awakened"]} end
            c = c + 1
        end
        for k,v in pairs(Awaked) do
            if v["Awakened"] == true then
                d = d+1
            end
        end
        if d >= c then 
            ff = true
        else
            ff = false
        end
    else 
        ff= true
    end
    return ff;
end
function CheckWorld()
    toreturn = "Not Found"
    placeId = game.PlaceId
    if placeId == 2753915549 then
        toreturn = "Sea 1"
    elseif placeId == 4442272183 then
        toreturn = "Sea 2"
    elseif placeId == 7449423635 then
        toreturn = "Sea 3"
    end
    return toreturn;
end
function btwisshortinformation()
    concacbu = ""
    if getgenv().AliasInformation == true then
        concacbu = " | "
        if CheckItem("Cursed Dual Katana") == true then
            concacbu = concacbu.."CDK"
        end
        if CheckItem("Soul Guitar") == true then 
            if CheckItem("Cursed Dual Katana") == true then
                concacbu = concacbu.."-"
            end
            concacbu = concacbu.."SG"
        end
        if CheckItem("Hallow Scythe") == true then 
            concacbu = concacbu.."-HS"
        end
        if CheckItem("True Triple Katana") == true then 
            concacbu = concacbu.."-TTK"
        end
    end
    return concacbu;
end
function CheckRace()
    RaceEvolued = "V1"
    V3 = false
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Agility" or v.Name == "Heightened Senses" or v.Name == "Water Body" or v.Name == "Heavenly Blood" or v.Name == "Energy Core" or v.Name == "Last Resort" then
            V3 = true
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Agility" or v.Name == "Heightened Senses" or v.Name == "Water Body" or v.Name == "Heavenly Blood" or v.Name == "Energy Core" or v.Name == "Last Resort" then
            V3 = true
        end
    end
    local cac5555 = {
        [1] = "Alchemist",
        [2] = "1"
    }
    pcall(function()
        if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(cac5555))) == -2 and V3 == true then
            RaceEvolued = "V3"
        elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(cac5555))) == -2 then
            RaceEvolued = "V2"
        end
    end)
    toreturn = game:GetService("Players").LocalPlayer.Data.Race.Value.." "..RaceEvolued
    return toreturn;
end
function PlayerCount()
    return game.Players.NumPlayers;
end    
function formatNumber(v)
    return tostring(v):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end
function isinventoryontop()
    cailonto = ""
    if getgenv().InventoryOnTop then
        cailonto = "Inventory: "..GetListWeapon(getgenv().InventoryRarity).."\nInventory Fruit: "..getInventoryFruits(getgenv().FruitInventoryRarity).."\nLevel: "..game.Players.LocalPlayer.Data.Level.Value.." | "..MeleeCount().."\nBeli: "..formatNumber(game.Players.LocalPlayer.Data.Beli.Value).."\nFragment: "..formatNumber(game.Players.LocalPlayer.Data.Fragments.Value).."\nWorld: "..CheckWorld().."\nPlayers: "..PlayerCount().."\n"..CheckDevilFruit()
    else
        cailonto = "Level: "..game.Players.LocalPlayer.Data.Level.Value.." | "..MeleeCount().."\nBeli: "..formatNumber(game.Players.LocalPlayer.Data.Beli.Value).."\nFragment: "..formatNumber(game.Players.LocalPlayer.Data.Fragments.Value).."\nWorld: "..CheckWorld().."\nPlayers: "..PlayerCount().."\n"..CheckDevilFruit().."\nInventory: "..GetListWeapon(getgenv().InventoryRarity).."\nInventory Fruit: "..getInventoryFruits(getgenv().FruitInventoryRarity)
    end
    return cailonto;
end
local RAMAccount = loadstring(game:HttpGet'https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua')()
local RAMPANEL = RAMAccount.new(game:GetService'Players'.LocalPlayer.Name)
if RAMPANEL then 
    print("Getting account...")
    RAMPANEL:SetAlias("Level: "..game.Players.LocalPlayer.Data.Level.Value.." | "..MeleeCount()..btwisshortinformation())
    print(InventoryOnTop)
    RAMPANEL:SetDescription(isinventoryontop())
end
--("Level: "..game.Players.LocalPlayer.Data.Level.Value.." | "..MeleeCount().."Inventory: "..GetListWeapon(getgenv().InventoryRarity).."\nInventory Fruit: "..getInventoryFruits(getgenv().FruitInventoryRarity).."\n"..CheckDevilFruit())
