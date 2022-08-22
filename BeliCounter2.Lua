--beli counter

Beli = Drawing.new("Text")
Beli.Text = "Wait for changed"
Beli.Color = Color3.fromRGB(0, 205, 0)
Beli.Position = Vector2.new(game:GetService("Workspace").CurrentCamera.ViewportSize.X/2.22, game:GetService("Workspace").CurrentCamera.ViewportSize.Y/999)
Beli.Size = 30
Beli.Visible = true
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.Players.LocalPlayer:FindFirstChild("Data")
repeat wait() until game.Players.LocalPlayer.Data:FindFirstChild("Beli")
oldbeli = game:GetService("Players").LocalPlayer.Data.Beli.Value
totalbeli = 0
local SaveDatas = {
    ["Total Beli"] = {
        ["Beli Counter"] = 0,
    },
	["Time Counter"] = {
		["Hour"] = 0,
		["Minute"] = 0,
		["Second"] = 0,
	}
}

function Load()
    if readfile and writefile and isfile then
        if isfile("BeliCounter-" .. game.Players.LocalPlayer.Name .. ".json") == false then
            print('belicounter fail ')
            writefile("BeliCounter-" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(SaveDatas))
        else
            local Decode = game:GetService("HttpService"):JSONDecode(readfile("BeliCounter-" .. game.Players.LocalPlayer.Name .. ".json"))
            for i,v in pairs(Decode) do
                SaveDatas[i] = v
            end 
        end
    else
        warn("Failed Load")
        return false
    end
end
Load()
function Save()
    if readfile and writefile and isfile then
        if isfile("BeliCounter-" .. game.Players.LocalPlayer.Name .. ".json") == false then
            Load()
        else
            local Decode = game:GetService("HttpService"):JSONDecode(readfile("BeliCounter-" .. game.Players.LocalPlayer.Name .. ".json"))
            local Array = {}
            for i,v in pairs(SaveDatas) do
                Array[i] = v
            end
            writefile("BeliCounter-" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(Array))
        end
    else
        warn("Failed Save")
        return false
    end
end
local totalbountyinfile = SaveDatas["Total Beli"]["Beli Counter"]
local lasthour = SaveDatas["Time Counter"]["Hour"]
local lastminute = SaveDatas["Time Counter"]["Minute"]
local lastsecond = SaveDatas["Time Counter"]["Second"]
game:GetService("Players").LocalPlayer.Data.Beli.Changed:Connect(function(cac)
    local newbeli = tonumber(cac)
    totalbeli = newbeli - oldbeli
    count = 0
    if SaveDatas["Total Beli"]["Beli Counter"] <= 0 then
        SaveDatas["Total Beli"]["Beli Counter"] = totalbeli
        Save()
    elseif SaveDatas["Total Beli"]["Beli Counter"] > 0 then
        SaveDatas["Total Beli"]["Beli Counter"] = totalbountyinfile + totalbeli
        Save()
    end
    for i,v in pairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Chest") then
            count = count+1
        end
    end
    Beli.Text = "Total Beli: "..SaveDatas["Total Beli"]["Beli Counter"].."\nTimer: "..SaveDatas["Time Counter"]["Hour"].."h:"..SaveDatas["Time Counter"]["Minute"].."m:"..SaveDatas["Time Counter"]["Second"].."s\nChest Left: "..count
end)
while wait() do
    Load()
	local GameTime = math.floor(workspace.DistributedGameTime+0.5)
	local Hour = math.floor(GameTime/(60^2))%24
	local Minute = math.floor(GameTime/(60^1))%60
	local Second = math.floor(GameTime/(60^0))%60
	if SaveDatas["Time Counter"]["Hour"] <= 0 then
		SaveDatas["Time Counter"]["Hour"] = Hour
		Save()
	elseif SaveDatas["Time Counter"]["Hour"] > 0 then
		SaveDatas["Time Counter"]["Hour"] = lasthour + Hour
		Save()
	end
	if SaveDatas["Time Counter"]["Minute"] <= 0 then
		SaveDatas["Time Counter"]["Minute"] = Minute
		Save()
	elseif SaveDatas["Time Counter"]["Minute"] > 0 then
		SaveDatas["Time Counter"]["Minute"] = lastminute + Minute
		Save()
	end
	if SaveDatas["Time Counter"]["Second"] <= 0 then
		SaveDatas["Time Counter"]["Second"] = Second
		Save()
	elseif SaveDatas["Time Counter"]["Second"] > 0 then
		SaveDatas["Time Counter"]["Second"] = lastsecond + Second
		Save()
	end
	if SaveDatas["Time Counter"]["Second"] >= 60 then
		SaveDatas["Time Counter"]["Second"] = SaveDatas["Time Counter"]["Second"]-60
		SaveDatas["Time Counter"]["Minute"] = SaveDatas["Time Counter"]["Minute"] + 1
		print('+1 for minute')
		Save()
	end
	
	if SaveDatas["Time Counter"]["Minute"] >= 60 then
		SaveDatas["Time Counter"]["Minute"] = SaveDatas["Time Counter"]["Minute"]-60
		SaveDatas["Time Counter"]["Hour"] = SaveDatas["Time Counter"]["Hour"] + 1
		print('+1 for hour')
		Save()
	end
    wait(0.1)
end
