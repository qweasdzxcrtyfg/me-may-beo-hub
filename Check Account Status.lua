local dontexeucte = {}
---script
repeat wait() until game:IsLoaded()
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer:FindFirstChild("Data")
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
repeat wait() until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
repeat wait() until game.Players.LocalPlayer:FindFirstChild("Backpack")
repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
wait(2)
function CheckWorld()
    toreturn = "Not Found"
    placeId = game.PlaceId
    if placeId == 2753915549 then
        toreturn = "Blox Fruits | Sea 1"
    elseif placeId == 4442272183 then
        toreturn = "Blox Fruits | Sea 2"
    elseif placeId == 7449423635 then
        toreturn = "Blox Fruits | Sea 3"
    end
    return toreturn;
end
function CheckDevilFruit()
    local toreturn = "Not eqipped"
    if game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == "" then
        toreturn = "Sorry son this account not equipped some devil fruit"
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
            New2 = {}
            for i,v in next, Awaked do
                if v["Awakened"] == true then
                    New2[i] = ":white_check_mark:"
                elseif v["Awakened"] == false then
                    New2[i] = ":x:"
                end
            end
            for i,v in next, New2 do
                toreturn = toreturn..i..": "..v.."\n"
            end
        else
            toreturn = toreturn.."Cant Awake This Fruit Bri"
        end
    end
    return toreturn;
end
function CheckInventory()
    toreturn = ""
    RareItem = {}
    RareItem2 = ""
    RareItem3 = ""
    RareCount = 0
    total = 0
    MythicCount = 0
    MythicItem = {}
    MythicItem2 = ""
    MythicItem3 = ""
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
        RareItem2 = RareItem2..v..",\n"
    end
    for i,v in next, MythicItem do
        MythicItem2 = MythicItem2.."- "..v..",\n"
    end
    if MythicCount > 1 then MythicItem3 = "```diff\n"..MythicItem2.."```" end
    if RareCount > 1 then RareItem3 = "```\n"..RareItem2.."```" end
    toreturn = MythicItem3..RareItem3
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
        toreturn = toreturn..v..",\n"
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
            MeleeArleady2[i] = ":white_check_mark:"
        elseif v == false then
            MeleeArleady2[i] = ":x:"
        end
    end
    for i,v in next, MeleeArleady2 do
        toreturn33 = toreturn33..i..": "..v.."\n"
    end
    return toreturn33
end
function CheckAccountIsAutoShudown()
    if getgenv().ShutdownGameOnLevel then
        a = "Account Game Was Shutdowned"
    else
        a = ""
    end
    return a;
end
getgenv().CustomMessage = "Nigger"
getgenv().DiscordUserId = 0
function dontexeucte:SetCustomMessage(Message) getgenv().CustomMessage = Message end
function dontexeucte:SetUrl(Url2) getgenv().URLLEVELMAX = Url2 end
function dontexeucte:SetId(Id) getgenv().DiscordUserId = Id end
function dontexeucte:Send()
    if getgenv().URLLEVELMAX == "" then return; end
    local HttpService = game:GetService("HttpService")
    local Data =  {
        ["content"] = getgenv().CustomMessage.."<@"..getgenv().DiscordUserId..">",
        ["embeds"]= {
            {            
                ["title"]= "PornHub Invite!";["url"]= "https://www.pornhub.com";
                ["description"]= "Note: The Melee-Check Method Is Not Buy Then Load,So Cant Get Mastery.\n".."Account: ||"..game.Players.LocalPlayer.Name.."||";
                ["color"]= tonumber(0xe962e2);
                ["fields"]= {
                    {
                        ["name"]= "Devil Fruit:",
                        ["value"]= CheckDevilFruit(),
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Normal Stats:",
                        ["value"]= "```Level: "..game:GetService("Players").LocalPlayer.Data.Level.Value.."\nBeli: "..game:GetService("Players").LocalPlayer.Data.Beli.Value.."\nFragment: "..game:GetService("Players").LocalPlayer.Data.Fragments.Value.."\nRace: "..game:GetService("Players").LocalPlayer.Data.Race.Value.."\nWorld In: "..CheckWorld().."```",
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Fruit Inventory(1M+)",
                        ["value"]= "```"..CheckInventoryFruit().."```",
                        ["inline"]= true
                    },
                    {
                        ["name"]= "Weapons(Rare)",
                        ["value"]= CheckInventory(),
                        ["inline"]= true
                    },
                    {
                        ["name"] = "Melee:",
                        ["value"] = CheckAlreadyMelees(),
                        ["inline"] = true
                    },
                    {
                        ["name"]= "Materials",
                        ["value"]= "```"..CheckValuable().."```",
                        ["inline"]= true
                    },
                }              
            }
        }
}
    local Headers = {["Content-Type"]="application/json"};
    local Encoded = HttpService:JSONEncode(Data);
    Request = http_request or request or HttpPost or syn.request
    local Final = {Url = getgenv().URLLEVELMAX, Body = Encoded, Method = "POST", Headers = Headers};
    Request(Final)
end
return dontexeucte;