--Execute this config before execute script
if not game:IsLoaded() then game.Loaded:Wait() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");

local DefaultSetting = {
    Bringmob2 = false,
    Autobuso2 = false,
    autohakiken2 = false,
    autosetspawn2 = false,
    autofarm3 = false,
    autonewworld2 = false,
    autothirdseafully2 = false,
    autofullymelee3 = false,
    autofarmmasterymeleev22 = false,
    autolegendsword2 = false,
    autobuyhakicolor2 = false,
    autobuydfcousin2  =false,
    autobringdevilfruit2 = false,
    autostorefruit3 = false,
    autogetfruitstore2 = false,
    autohopbuyLegendarysword2 = false,
    autohopbuyhakicolor2 = false,
    autofarmbounty2 = false,
    hopserverfarmbounty2 = false,
    autoenergycore2 = false,
    autosave2 = false,
    tablestats = {
        ["Melee"] = false,
        ["Defense"] = false,
        ["Sword"] = false,
        ["Gun"] = false,
        ["Demon Fruit"] = false,
    },
    urlwebhook2 = "",
    webhookprofile2 = false,
    autofactory2 = false,
    webhookhuntbounty2 = false,
    pickskillmelee1 = {
        ["Z"] = false,
        ["X"] = false,
        ["C"] = false,
        ["V"] = false,
        ["F"] = false,
    },
    pickskillDevilFruit1 = {
        ["Z"] = false,
        ["X"] = false,
        ["C"] = false,
        ["V"] = false,
        ["F"] = false,
    },
    autostatsmeleedefense2 = false,
    autom1s2 = false,
    autoaccessory = false,
    Fastattack2 = false,
    autoraidshop2 = false,
    autoawake2 = false,
    pickraids2 = "",
    TableMeleeMake = {
        ["Superhuman"] = false,
        ["Death Step"] = false,
        ["Sharkman Karate"] = false,
        ["Electric Claw"] = false,
        ["Dragon Talon"] = false,
    },
    TableGetSword = {
        ["Saber"] = false,
        ["Yama"] = false,
        ["Tushita"] = false,
        ["Cavander"] = false,
        ["Pole v1"]  = false,
        ["Buddy Sword"] = false,
        ["Rengoku"] = false,
    },
    autofullySword3 = false,
    autodoublequest2 = false,
    hopseeversame1 = false,
    holdskillz1 = 0.5,
    holdskillx1 = 0.5,
    holdskillc1 = 0.5,
    holdskillv1 = 0.5,
    holdskillf1 = 0.5,
    autoallboss2 = false,
    FarmBossHop2 = false,
    SelectBoss2 = "",
    autogetquestboss2 = false,
    autoboss2 = false,
    HopBossSelect2 = false,
    AutoRedeem = false,
    AutoRejoinDisconnect = false,
    autohodhuman2 = false,
    Speedtween2 =  150,
    autogetchipdough2 = false,
    hopfindelitechipdough2 = false,
    SelectWp2 = "",
}
if not isfolder("Sitink Hub-BloxFruit") then
    makefolder("Sitink Hub-BloxFruit")
end
writefile("Sitink Hub-BloxFruit/"..game.Players.LocalPlayer.Name..".json", game:GetService("HttpService"):JSONEncode(DefaultSetting))
Setting = game:GetService("HttpService"):JSONDecode(readfile("Sitink Hub-BloxFruit/"..game.Players.LocalPlayer.Name..".json"))
Setting.autosave2 = true
Setting.autofarm3 = true
Setting.autodoublequest2  = true
Setting.Fastattack2  = true
Setting.autostatsmeleedefense2  = true
Setting.Bringmob2 = true
Setting.Autobuso2 = true
Setting.autosetspawn2 = true
Setting.autonewworld2 = true
Setting.autothirdseafully2 = true
Setting.autolegendsword2 = true
Setting.autobuyhakicolor2 = true
Setting.autobuydfcousin2 = true
Setting.autostorefruit3 = true
Setting.autogetfruitstore2 = true
Setting.TableMeleeMake["Superhuman"] = true
Setting.TableMeleeMake["Sharkman Karate"] = true
Setting.TableMeleeMake["Death Step"] = true
Setting.TableMeleeMake["Dragon Talon"] = true
Setting.TableMeleeMake["Electric Claw"] = true
Setting.autofullymelee3 = true
Setting.TableGetSword["Yama"] = true
Setting.TableGetSword["Cavander"] = true
Setting.TableGetSword["Tushita"] = true
Setting.TableGetSword["Pole v1"] = true
Setting.TableGetSword["Rengoku"] = true
Setting.TableGetSword["Saber"] = true
Setting.TableGetSword["Buddy Sword"] = true
Setting.autofullySword3 = true
Setting.AutoRedeem = true
Setting.AutoRejoinDisconnect = true

writefile("Sitink Hub-BloxFruit/"..game.Players.LocalPlayer.Name..".json", game:GetService("HttpService"):JSONEncode(Setting))