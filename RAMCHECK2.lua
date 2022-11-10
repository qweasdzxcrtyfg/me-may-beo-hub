getgenv().ChooseTeam = "Pirate"
getgenv().FruitInventoryRarity = 3 -->= 3
getgenv().InventoryRarity = 4 -->= 4
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
wait(3)
local RAMAccount = loadstring(game:HttpGet'https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua')()

local MyAccount = RAMAccount.new(game:GetService'Players'.LocalPlayer.Name)

if MyAccount then
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
    print("Loaded Account.\nAccount: "..game:GetService'Players'.LocalPlayer.Name)
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
    MyAccount:SetAlias("Level: "..game.Players.LocalPlayer.Data.Level.Value.." | "..MeleeCount())
    MyAccount:SetDescription("Inventory: "..GetListWeapon(getgenv().InventoryRarity).."\nInventory Fruit: "..getInventoryFruits(getgenv().FruitInventoryRarity).."\n"..CheckDevilFruit())
end
