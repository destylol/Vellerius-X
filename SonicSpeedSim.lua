-- Wait until fully loaded.
repeat wait() until game:IsLoaded();

-- Global toggles
getrenv().AutoStep = false;
getrenv().AutoRebirth = false;
getrenv().AutoCollect = false;
getrenv().AutoBankRewards = false;

-- Random Locals
local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local RunService = game:GetService("RunService");
local RootPart = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart");
local TweenData = TweenInfo.new(math.random(1,99), Enum.EasingStyle.Linear);
local Rand = math.random(1,999999999);

-- Teleport Func
function TP()
    local TPCFrame = CFrame.new(Rand,Rand,Rand);
    local tween,err = pcall(function()
        local tween = TweenService:Create(RootPart, TweenData, {CFrame=TPCFrame});
        tween:Play();
    end)
end

-- UI Lib
local lib = loadstring(game:HttpGet("https://gitlab.com/L1ZOT/test-project/-/raw/main/PJM-GUI"))()

-- Main UI Stuff
local Window = lib:Window("Vellerius X", "Sonic Speed Simulator")
local AutoFarm = Window:Tab("Autofarm")
local OtherTab = Window:Tab("Credits")

AutoFarm:line()

AutoFarm:Toggle("Auto Run",false, function(v)
    _G.Run = v
    if _G.Run == v then
        local FastCFrame = CFrame.new(0,0,0)
        local OldNamecall = nil

        OldNamecall = hookmetamethod(game, '__namecall', function(self,...)
            local args = {...}
            local method = getnamecallmethod()
            
            if tostring(self) == 'UpdateCharacterState' and method == 'FireServer' then
                args = {
                    [1] = {
                        ['Character'] = game:GetService('Players').LocalPlayer.Character,
                        ['CFrame'] = FastCFrame,
                        ['IsRunning'] = true
                    }
                }
                for i = 1,100 do
                    return self.FireServer(self, unpack(args))
                end
            end
            
            return OldNamecall(self,...)
        end)

        game:GetService('RunService').Heartbeat:Connect(function()
            FastCFrame = FastCFrame + Vector3.new(10,10,10)
		end)
    end
end)

AutoFarm:Toggle("Collect All",false, function(v)
    _G.Collect = v
    if _G.Collect == v then
        repeat wait() until game:IsLoaded()

        spawn(function()
            while wait(1) do
            for i,v in pairs(game:GetService("Workspace").Map.Objects:GetChildren()) do
                if v:IsA("Model") then 
                    game:GetService("ReplicatedStorage").Knit.Services.WorldCurrencyService.RE.PickupCurrency:FireServer(v.Name)
                    end
                end
            end
        end)    
    end
end)

AutoFarm:Button("Collect Orbs/Rings", function(v)
    repeat wait() until game:IsLoaded()

    spawn(function()
        while wait(1) do
        for i,v in pairs(game:GetService("Workspace").Map.Objects:GetChildren()) do
            if v:IsA("Model") then 
                game:GetService("ReplicatedStorage").Knit.Services.WorldCurrencyService.RE.PickupCurrency:FireServer(v.Name)
                end
            end
        end
    end)    
end)

AutoFarm:Toggle("Collect All Server Hop",false,function()
    repeat wait() until game:IsLoaded()

    spawn(function()
        while wait(1) do
        for i,v in pairs(game:GetService("Workspace").Map.Objects:GetChildren()) do
            if v:IsA("Model") then 
                game:GetService("ReplicatedStorage").Knit.Services.WorldCurrencyService.RE.PickupCurrency:FireServer(v.Name)
                end
            end
        end
    end)

    spawn(function()
        wait(6) --- perfer 6
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        local File = pcall(function()
            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
        end)
        if not File then
            table.insert(AllIDs, actualHour)
            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
        end
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    delfile("NotSameServers.json")
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end

        function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        getgenv().serverhop = Teleport
    end)
end)

AutoFarm:Button("Auto Rebirth", function(v)
    _G.Rebirth = v
    if _G.Rebirth == v then
        spawn(function()
            game:GetService("ReplicatedStorage").Knit.Services.LevelingService.RF.AttemptRebirth:InvokeServer()
        end)
    end
end)

AutoFarm:line()

AutoFarm:Toggle("Auto Bank Rewards",false, function(v)
    _G.Bank = v
    if _G.Bank == v then
        spawn(function()
            while wait(5) do -- You have to wait 6 hours until you can collect again so we check every 10 mins.
                if AutoBankRewards then
                    local Plr = game:GetService("Players").LocalPlayer;
                    local RewardsBanks = game:GetService("Workspace").Map.Collision.RewardBanks;
                    local v1 = require(game:GetService("ReplicatedStorage").Knit);
                    
                    for i,v in pairs(RewardsBanks:GetChildren()) do
                        if v:IsA("Model") then
                            v1.GetService("RewardService").GiveRewardInBank(Plr, v.Name); -- Directly call Knit func.
                        end
                    end
                end
            end
        end)
    end
end)

-- Auto Gift
AutoFarm:Toggle("Auto Gifts",false, function(v)
   _G.Gifts = v
   if _G.Gifts == v then
         spawn(function()
            local A_1 = 1
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
         
            local A_1 = 2
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
         
            local A_1 = 3
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
         
            local A_1 = 4
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
         
            local A_1 = 5
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
         
            local A_1 = 6
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
         
            local A_1 = 7
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
         
            local A_1 = 8
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
            
            local A_1 = 9
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
            
            local A_1 = 10
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
            
            local A_1 = 11
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
            
            local A_1 = 12
            local Event = game:GetService("ReplicatedStorage").Knit.Services.GratitudeService.RF.AcquireReward
            Event:InvokeServer(A_1)
         end)
      end
end)

AutoFarm:line()

AutoFarm:Button("Unlock Worlds", function()
    local Knit = game:GetService("ReplicatedStorage").Knit;
    local RequestTeleportToZone = Knit.Services.ZoneService.RF.RequestTeleportToZone;
    local CompleteZoneObby = Knit.Services.ZoneService.RF.CompleteZoneObby;
    
    RequestTeleportToZone:InvokeServer("Lost Valley Obby", "Green Hill Exit")
    CompleteZoneObby:InvokeServer()
    wait(0.3)
    
    RequestTeleportToZone:InvokeServer("Emerald Hill Obby", "Lost Valley Exit")
    CompleteZoneObby:InvokeServer()
    wait(0.3)
    
    RequestTeleportToZone:InvokeServer("Snow Valley Obby", "Emerald Hill Exit")
    CompleteZoneObby:InvokeServer()
end)

AutoFarm:Button("Unlock Characters", function()
    local Knit = game:GetService("ReplicatedStorage").Knit;
    local RequestUnlockCharacter = Knit.Services.CharacterService.RE.RequestUnlockCharacter;
    local RequestTeleportToZone = Knit.Services.ZoneService.RF.RequestTeleportToZone;
    local RedeemCode = Knit.Services.RedeemService.RF.RedeemCode;
    
    RequestTeleportToZone:InvokeServer("Green Hill")
    RequestUnlockCharacter:FireServer("sonic")
    wait(0.3)
    
    RequestTeleportToZone:InvokeServer("Lost Valley")
    RequestUnlockCharacter:FireServer("tails")
    wait(0.3)
    
    RequestTeleportToZone:InvokeServer("Emerald Hill")
    RequestUnlockCharacter:FireServer("knuckles")
    wait(0.3)
    
    RedeemCode:InvokeServer("riders")
end)

AutoFarm:line()

OtherTab:Label("Credits: Mana#9724 - UI Creator")
OtherTab:Label("Credits: Corrupt#2625 - Main Script")

-- Anti AFK
for i,v in pairs(getconnections(Players.LocalPlayer.Idled)) do
    v:Disable()
end
