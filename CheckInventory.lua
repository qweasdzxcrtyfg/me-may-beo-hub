CheckInventory = {}
function CheckInventory:Check()
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
return CheckInventory;
