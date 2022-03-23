-- Version: 1.0.0

--Key system
local keys = {
    "Complex"
} 

--Executor Checker
local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "Unknown Exploit"

local HWID = game:GetService("RbxAnalyticsService"):GetClientId();

local url = "https://discord.com/api/webhooks/943123597206126642/WySBceHKC3TsVCGWaMIuk1czfA3yr0I4nvjl6lC0sKyz7JLmV4YmplTndMAybrKfUSPb"
local data = {
    ["content"] = "> **Player HWID: `"..HWID.."`**",
    ["embeds"] = {
        {
            ["title"] = "**A Execution of Free Version detected!**",
            ["description"] = "Username: " .. game.Players.LocalPlayer.Name.." with **"..webhookcheck.."**",
            ["type"] = "rich",
            ["color"] = tonumber(0x7269da),
            ["url"] = "https://www.roblox.com/users/".. game.Players.LocalPlayer.UserId .."/profile",
        }
    }
}

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}

request = http_request or request or HttpPost or syn.request

local msg = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(msg)

--Moderator Checker
for i, v in pairs(game.Players:GetPlayers()) do
    if
        v:GetRoleInGroup(4372130) == "Contributor" or v:GetRoleInGroup(4372130) == "Dev" or
            v:GetRoleInGroup(4372130) == "Developer" or
            v:GetRoleInGroup(4372130) == "Owner"
     then
        game.Players.LocalPlayer:Kick("A moderator in the game, you're kicked for your safety!")
    end
end

--Anti AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local premium = {
    "FF41096E-1A0F-45B6-BA44-9F4083E65924", --RFRestaurant_Holder
    "9BD1B9C7-A2CC-480A-A19C-E23D567974F0", --Convocation 
    "7E4EFF6F-3325-48A0-937D-B92A4C65D01F", --demonsspeaking
    "FF41096E-1A0F-45B6-BA44-9F4083E65924", --Lynz_Chloe
    "F1C5CAA7-61C6-4B9D-8FE5-0E81D34CB6B1", --v8dosAdri
    "6244DF23-18BC-44CE-8991-5D7EDBB51D66", --Thomas_mp5 [Administrator]
    "C86AADD1-AC21-484D-B5A5-0F383E29AAB8", --ilikeupaps
    "4BBC9355-A2D9-48A7-80C7-5A7F4AC6EAB6", --BOIYOUDIEDTOME
    "2A3F0BB6-7C09-448C-A782-8079EBAF2FA1", --Corrupt
} 

local hwidBanned = {
    "32CDC316-A0E2-49A9-9A3C-8AC479E0E74A",
}

local HWID = game:GetService("RbxAnalyticsService"):GetClientId();

local function checkKey(value)
    if table.find(keys, value) then
        game:GetService("CoreGui"):FindFirstChild("Lynzv X | Key System"):Destroy()
        wait(1)
        getgenv().A53C59H2E539D4VAG153W_KeyCheck = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Corrupt2625/Bloxfruits/main/Main.lua"))()
    else
        game.Players.LocalPlayer:Kick("Invalid Key! Please join [discord.gg/fzUsmYZgDf] for key!")
    end
end

if table.find(hwidBanned,HWID) then
    game.Players.LocalPlayer:Kick("Script Banned! Appeal in [discord.gg/fzUsmYZgDf]!")
elseif table.find(premium, HWID) then
    getgenv().B2WA42W153C5EF6A653AB_KeyCheck = true
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Corrupt2625/Bloxfruits/main/Main.lua"))()
else
    local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
    
    local GRGUI = Material.Load({
        Title = "Lynzv-CX | Key System",
        Style = 2,
        SizeX = 450,
        SizeY = 300,
        Theme = "Dark",
        MainFrame = {
            Color3.fromRGB(235,235,235)
        }
    })

    local KeyTab = GRGUI.New({
        Title = "Key Tab",
    })

    local KeyText = KeyTab.TextField({
        Text = "Key Here",
        Callback = function(value)
            checkKey(value)
        end
    })
end
