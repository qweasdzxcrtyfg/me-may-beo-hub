--function auto get yama and tutshita
done = {
    ["Yama"] = false,
    ["Tushita"] = false,
}
function CheckItem(ItemName)
    local final = false
    local a = false
	local WeaponsList = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons");
    for i,v in pairs(WeaponsList) do 
        if v.Name == ItemName then
        a = true
        end 
    end
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ItemName) then
        a = true
    end
    if game.Players.LocalPlayer.Character:FindFirstChild(ItemName) then
        a = true
    end
    final = a 
    return final; 
end
function LoadItem(ItemName)
    if CheckItem(ItemName) == true and not game.Players.LocalPlayer.Character:FindFirstChild(ItemName) and not game.Players.LocalPlayer.Backpack:FindFirstChild(ItemName) then
        local args = {
            [1] = "LoadItem",
            [2] = ItemName
        }
        
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end
function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end
function CheckYama()
    if CheckItem("Yama") and done["Yama"] == false then
        LoadItem("Yama")
        EquipWeapon("Yama")
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.Name == "Yama" then
                if v.Level.Value >= 350 then
                    print("ready to do cdk")
                    done["Yama"] = true
                else
                    EquipWeapon("Yama")
                end
            end
        end
    end
end
function CheckTushita()
    if CheckItem("Tushita") and done["Tushita"] == false then
        LoadItem("Tushita")
        EquipWeapon("Tushita")
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.Name == "Tushita" then
                if v.Level.Value >= 350 then
                    CheckYama()
                    done["Tushita"] = true
                else
                    EquipWeapon("Tushita")
                end
            end
        end
    elseif CheckItem("Tushita") == false then
        AutoYama()
    end
end
while wait() do
    pcall(function()
        CheckTushita()
    end)
end

        

