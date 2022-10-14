local CheckCC = {}
function CheckCC:Check()
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
return CheckCC;
