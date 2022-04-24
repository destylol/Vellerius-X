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
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/UILibs/LuminosityV1.lua"))()

-- Main UI Stuff
local Window = lib:Window("Vellerius X", "Sonic Speed Simulator")
local AutoFarm = Window:Tab("Autofarm")
local OtherTab = Window:Tab("Unlocks")

-- Auto Steps
AutoFarm:Toggle("Auto Step", function(v)
    if v then
      lib:Notifacation("Notification", "Auto increase steps", "Okay")
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

-- Auto Rebirth
AutoFarm:Toggle("Auto Rebirth", function(v)
    lib:Notifacation("Notification", "Auto rebirth at max level", "Okay")
    AutoRebirth = v;
end)

-- Auto Collect
AutoFarm:Toggle("Collect All", function(v)
   lib:Notifacation("Notification","Auto collect all rings/orbs", "Okay")
    AutoCollect = v;
end)

-- Auto Bank Rewards
AutoFarm:Toggle("Auto Bank Rewards", function(v)
    lib:Notifacation("Notification","Auto collects bank rewards (every 6 hours)", "Okay")
    AutoBankRewards = v;
end)

-- Unlock All Worlds
OtherTab:Button("Unlock Worlds", function()
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

-- Unlock All Characters
OtherTab:Button("Unlock Characters", function()
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

-- Menu Closing Function
game:GetService("UserInputService").InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.RightControl then
        Window:Toggle()
    end
end)

-- Anti AFK
for i,v in pairs(getconnections(Players.LocalPlayer.Idled)) do
    v:Disable()
end

-- [[ Auto Farm Functions ]] --

-- Auto Step
spawn(function()
    RunService.RenderStepped:Connect(function()
        if AutoStep then
            pcall(function() TP(); end)
        end
    end)
end)

-- Auto Rebirth
spawn(function()
    while wait(3) do
        if AutoRebirth then
            local Knit = game:GetService("ReplicatedStorage").Knit;
            local AttemptRebirth = Knit.Services.LevelingService.RF.AttemptRebirth;
            AttemptRebirth:InvokeServer();
        end
    end
end)

-- Auto Collect All
spawn(function()
    while wait(5) do -- They respawn every 60 seconds so no need to spam.
        if AutoCollect then
            local ReplicatedStorage = game:GetService("ReplicatedStorage");
            local PickupCurrency = ReplicatedStorage.Knit.Services.WorldCurrencyService.RE.PickupCurrency;
            local Objects = game:GetService("Workspace").Map.Objects;
        
            for i,v in pairs(Objects:GetChildren()) do
            	if v:IsA("Model") then 
            		PickupCurrency:FireServer(v.Name)
            	end
            end
        end
    end
end)

-- Auto Bank Rewards
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
