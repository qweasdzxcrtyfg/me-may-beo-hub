        --Note: This checker need u join the teams, so the auto join was used.
        --Ram Settings: Turn On All(Not "Every Request Require Password"), Port is: 7963(change = no work) No password.
        --work after execute 6second(s)
        ---Settings
        getgenv().ChooseTeam = "Pirate"
        ---script
        repeat wait() until game:IsLoaded()
        repeat wait() until game.Players
        repeat wait()
        until game:IsLoaded() and game.Players.LocalPlayer
        repeat wait()
        until game:GetService("Players").LocalPlayer:FindFirstChild("DataLoaded")
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
        wait(5)
        local RAMAccount = loadstring(game:HttpGet'https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua')()

        local MyAccount = RAMAccount.new(game:GetService'Players'.LocalPlayer.Name)
        if MyAccount then 
            print("Loaded Account.\nAccount: "..game:GetService'Players'.LocalPlayer.Name)
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
        function CheckDevilFruit()
            local toreturn = "Not eqipped"
            local toreturn2 = ""
            if game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == "" then
                toreturn = "Not Eqipped"
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
                toreturn = tostring(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value.."\nMastery: "..checkmasterydf().."\n")
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
                function khongtru(name)
                    string22 = name:split("-")
                    return string22[2]
                end
                if table.find(Raids2,khongtru(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value)) then
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
                    toreturn = toreturn.."Cant Awake This Fruit Bri"
                end
            end
            return toreturn..""..toreturn2;
        end
        function CheckInventory()
            toreturn = ""
            RareItem = {}
            RareItem2 = ""
            RareItem3 = "Rare: "
            RareCount = 0
            total = 0
            MythicCount = 0
            MythicItem = {}
            MythicItem2 = ""
            MythicItem3 = "Mythical: "
            for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
                if tonumber(v["Rarity"]) >= 4 and tostring(v["Type"]) ~= "Blox Fruit" then
                    MythicCount = MythicCount + 1
                    table.insert(MythicItem,v["Name"])
                end 
            end
            for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
                if tonumber(v["Rarity"]) == 3 and tostring(v["Type"]) ~= "Blox Fruit" then
                    RareCount = RareCount + 1
                    table.insert(RareItem,v["Name"])
                end 
            end
            for i,v in next, RareItem do
                RareItem2 = RareItem2..v..", "
            end
            for i,v in next, MythicItem do
                MythicItem2 = MythicItem2..""..v..", "
            end
            if MythicCount > 1 then MythicItem3 = MythicItem3..MythicItem2 else MythicItem3 = "Mythical: Nothing" end
            if RareCount > 1 then RareItem3 = RareItem3..RareItem2 end
            toreturn = MythicItem3.."\n"..RareItem3
            return toreturn; 
        end
        function CheckValuable()
            toreturn = ""
            Valueble = {}
            total = 0
            for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
                if v["Type"] == "Material" then
                    toreturn2 = v["Name"].." x"..v["Count"]
                    table.insert(Valueble,toreturn2)
                end
            end
            for i,v in next, Valueble do
                toreturn = toreturn..v..", "
            end
            return toreturn; 
        end
        function CheckInventoryFruit()
            toreturn = "Nothing"
            fruits = {}
            total = 0
            for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                if v["Price"] >= 1000000 then
                    total = total + 1
                    table.insert(fruits,v["Name"])
                end
            end
            if total > 0 then
                toreturn = ""
            end
            for i,v in next, fruits do
                toreturn = toreturn..v..", "
            end 
            return toreturn;
        end
        function CheckMelee(MeeleName)
            local args = {
                [1] = "",
                [2] = true
            }
            if MeeleName == "Eletric Claw" then
                args[1] = "BuyElectricClaw"
            elseif MeeleName == "Super Human" then
                args[1] = "BuySuperhuman"
            elseif MeeleName == "Dragon Talon" then
                args[1] = "BuyDragonTalon"
            elseif MeeleName == "Sharkman Karate" then
                args[1] = "BuySharkmanKarate"
            elseif MeeleName == "God Human" then
                args[1] = "BuyGodhuman"
            elseif MeeleName == "Death Step" then 
                args[1] = "BuyDeathStep"
            end
            toreturn = false
            if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(args[1],true)) == 1 then
                toreturn = true
            end
            return toreturn;
        end
        function CheckAlreadyMelees()
            toreturn33 = ""
            toreturn2 = ""
            MeleeArleady = {
                ["Eletric Claw"] = CheckMelee("Eletric Claw"),
                ["Super Human"] = CheckMelee("Super Human"),
                ["Dragon Talon"] = CheckMelee("Dragon Talon"),
                ["God Human"] = CheckMelee("God Human"),
                ["Sharkman Karate"] = CheckMelee("Sharkman Karate"),
                ["Death Step"] = CheckMelee("Death Step"),
            }
            MeleeArleady2 = {}
            for i,v in pairs(MeleeArleady) do
                if v == true then
                    toreturn2 = toreturn2..i..", "
                end
            end
            for i,v in next, MeleeArleady2 do
                toreturn33 = toreturn33..i..": "..v.."\n"
            end
            return toreturn2
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
                if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(cac5555))) == -2 then
                    RaceEvolued = "V2"
                elseif tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(cac5555))) ~= -2 and V3 == true then
                    RaceEvolued = "V3"
                end
            end)
            toreturn = game:GetService("Players").LocalPlayer.Data.Race.Value.." "..RaceEvolued
            return toreturn;
        end
        function playercount()
            count = 0 
            for i,v in pairs(game.Players.LocalPlayer:GetChildren()) do
                if v then
                    count = count+1
                end
            end
        end
        if MyAccount then
            local NormalStats = "-----Normal Stats-----\nLevel: "..game.Players.LocalPlayer.Data.Level.Value.."\nBeli: "..game.Players.LocalPlayer.Data.Beli.Value.."\bFragment: "..game:GetService("Players").LocalPlayer.Data.Fragments.Value.."\nRace: "..CheckRace().."\nWorld At: "..CheckWorld()
            local Melee = "\n-----Melee-----".."\n"..CheckAlreadyMelees()
            local DevilFruit = "\n"..CheckDevilFruit()
            local Sword = "\n-----Sword-----\n"..CheckInventory()
            local FruitStored = "\n-----Inventory Fruit(1M+)-----".."\n"..CheckInventoryFruit()
            local ServerStats = playercount()
            local description = NormalStats..tostring(Melee)..tostring(DevilFruit)..tostring(Sword)..tostring(FruitStored)
            local description2 = CheckDevilFruit()
            MyAccount:SetDescription(description.."\nCredit to fb.com/jeffv12345")
        end