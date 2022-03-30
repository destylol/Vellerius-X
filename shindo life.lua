getgenv().TextColorChange = Color3.fromRGB(0, 128, 255)

if getgenv().Magnet then
    Mode = "Magnet"
else
    Mode = "Back"
end
repeat wait() until game:IsLoaded()
--old-antitp bypass
if workspace:FindFirstChild("CCoff") then
    game:GetService("Workspace").CCoff:Destroy()
end
--antiafk
local VirtualUser=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
	warn("anti-afk")
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)
--variables
local player = game.Players.LocalPlayer
local mission = player.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory")
local menuplace = 4616652839
local forestplace = 5447073001
local rainplace = 5084678830
local trainingplace = 5431071837
local akatsukiplace = 5431069982
local worldxplace = 5943874201
local villageplace = game:GetService("Workspace"):FindFirstChild("rank")
local warplace = game:GetService("Workspace"):FindFirstChild("warmode")
function toTarget(pos, targetPos, targetCFrame)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/getgenv().speed, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(90))})
        tween:Play()
    end)
    if not tween then return err end
end

--UI Lib Loading
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxciaz/VenyxUI/main/Reuploaded"))() --someone reuploaded it so I put it in place of the original back up so guy can get free credit.
local venyx = library.new("Lynzv-CX | Shindo life")
venyx:setTheme("TextColor",TextColorChange)

-- themes
local themes = {
Background = Color3.fromRGB(15, 15, 15),
Glow = Color3.fromRGB(0, 128, 255),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(10, 10, 10),
TextColor = Color3.fromRGB(0, 128, 255)
}

--Two page
local page2 = venyx:addPage("Autofarm", 6035145364)
local Farm = page2:addSection("Mission Farm")
local Scroll = page2:addSection("Scroll Farm")
getgenv().speed = 500


	local autofarm
	Farm:addToggle("AutoFarm", nil, function(bool)
		autofarm = bool
	end)

	local gift
    Farm:addToggle("Farm Gift Box", nil, function(bool)
		gift = bool
    end)
    
  	local RANKUP
    Farm:addToggle("AutoRank", nil, function(bool)
		RANKUP = bool
    end)
    
    	local jinfarm
    Scroll:addToggle("Jin Farm", nil, function(bool)
		jinfarm = bool
    end)

    Scroll:addToggle("Scroll Farm", nil, function(bool)
		scrollfarm = bool
    end)
    

--Warmode Page
local warmodepage = venyx:addPage("War Farm", 7251993295)
local warfarm = warmodepage:addSection("Warmode")

local war
    warfarm:addToggle("Warmode", nil, function(bool)
	   war = bool
	end)
	
    local reset
    warfarm:addToggle("Reset round 21", nil, function(bool)
        reset = bool
    end)

--Three page
local page3 = venyx:addPage("Quests Maker", 7061402283)
local d = page3:addSection("Quests Maker")

    d:addButton("Rush",function()
		for i = 1,300 do
			game.Players.LocalPlayer.Character.combat.update:FireServer("rushw")
			wait(.25)
		end
    end)

    d:addButton("Jumps",function()
		for v = 1,300 do
			game.Players.LocalPlayer.Character.combat.update:FireServer("takemovement2")
			wait(.25)
		end
    end)

    d:addButton("Chakra Charges",function()
		for i = 1,500 do
			game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
			wait(.1)
			game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
			wait(.5)
		end
    end)

    d:addButton("Punches",function()
		for i = 1,999 do
			game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1",true)
			wait(.3)
		end
    end)

    d:addButton("TP TrainLog",function()
        local player = game.Players.LocalPlayer
		toTarget(player.Character.HumanoidRootPart.Position,workspace.npc.logtraining:FindFirstChild("HumanoidRootPart").Position,CFrame.new(game:GetService("Workspace").npc.logtraining:FindFirstChild("HumanoidRootPart").Position))
	end)

	game:GetService('RunService').Stepped:connect(function()
		if autofarm or gift then
			pcall(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
		end
	end)
	local green = "http://www.roblox.com/asset/?id=5459241648"
	local red = "http://www.roblox.com/asset/?id=5459241799"
	local candy = "http://www.roblox.com/asset/?id=6078390771"
	spawn(function()
		while wait() do
			if autofarm then
				if  player.currentmission.Value == nil then
					for i,v in pairs(workspace.missiongivers:GetChildren()) do
						pcall(function()
							if player.currentmission.Value == nil and v.Name == "" and v:FindFirstChild("Head") and v.Head:FindFirstChild("givemission").Enabled and v.Head.givemission:FindFirstChild("color").Visible  then
								local TALK = v:FindFirstChild("Talk")
								local lvl = player.statz.lvl.lvl.Value
								if lvl <= 699 then
									if player.currentmission.Value == nil  and v.Talk:FindFirstChild("typ").Value == "defeat" and v.Head.givemission.Enabled and v.Head.givemission.color.Visible and v.Head.givemission.color.Image == green then
										local getmission = v:FindFirstChild("HumanoidRootPart")
										local clienttalk = v:FindFirstChild("CLIENTTALK")
										repeat wait(.3)
											toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
											if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 10 then
												clienttalk:FireServer()
												wait(.3)
												clienttalk:FireServer("accept")
											end
										until mission.Visible or v:FindFirstChild("Head").givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
									end
								elseif lvl >= 700 then
									if player.currentmission.Value == nil and TALK.typ.Value == "defeat" and v.Head.givemission.Enabled and v.Head.givemission.color.Visible and v.Head.givemission.color.Image == green or v.Head.givemission.color.Image == red then
										local getmission = v:FindFirstChild("HumanoidRootPart")
										local clienttalk = v:FindFirstChild("CLIENTTALK")
										repeat wait(.3)
											toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
											if (player.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 10 then
												clienttalk:FireServer()
												wait(.3)
												clienttalk:FireServer("accept")
											end
										until mission.Visible or v:FindFirstChild("Head").givemission.Enabled == false or player.currentmission.Value == "mission" or not autofarm
									end
								end
							end
						end)
					end
				else
					for i,v in pairs(workspace.npc:GetChildren()) do
						pcall(function()
						    if v.ClassName == "Model" and v:FindFirstChild("npctype") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 then
								repeat wait(.5)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-8,0)))
									v.Humanoid.Health = 0
								until v.Humanoid.Health == 0 or not autofarm or player.currentmission.Value == nil
							end
						end)
					end
				end
			end
		end
	end)
	spawn(function()
		while wait() do
			if gift then
				local spins = player.statz.spins.Value
				if spins < 500 then
					for i,v in pairs(workspace.missiongivers:GetChildren()) do
						pcall(function()
							if mission.Visible == false and v.ClassName == "Model" and v:FindFirstChild("Head"):FindFirstChild("givemission").Enabled and v:FindFirstChild("CLIENTTALK") and v:FindFirstChild("Talk") and string.find(v.Talk.talk1.Value, "Happy holidays, here is 1 FREE spin!") and v.Talk:FindFirstChild("typ").Value == "halloweenevent" and v.Head.givemission.color.Image == gift then
								repeat wait(.3)
									toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-5,0)))
									v.CLIENTTALK:FireServer()
									wait(.2)
									v.CLIENTTALK:FireServer("accept")
								until v:FindFirstChild("Head").givemission.Enabled == false or not gift
							end
						end)
					end
				else
					print("max spins reached 500")
				end
			end
		end
	end)
	local function SCROLLFARM()
		for i,v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED")
				pcall(function()
					toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
				end)
				scrollA:FireServer(game.Players.LocalPlayer)
				fireclickdetector(v.sh.ClickDetector)
			end
		end
	end
	local function SCROLLFARM1()
		for i,v in pairs(game.workspace:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and v.sh.Position.Y < 2000 then
				local scrollA = v.sh:FindFirstChild("invoke")
				print("SCROLL SPAWNED in workspace")
				pcall(function()
					toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.sh.Position,CFrame.new(v.sh.Position))
					scrollA:FireServer(game.Players.LocalPlayer)
					fireclickdetector(v.sh.ClickDetector)
				end)
			end
		end
	end

	spawn(function()
		while wait() do
			if scrollfarm then
				repeat wait()
					SCROLLFARM()
					SCROLLFARM1()
				until not scrollfarm or not war or not war2
			end
		end
	end)
	
		game:GetService('RunService').Stepped:connect(function()
		if war or war2 then
			pcall(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end)
		end
	end)

	spawn(function()
		while wait() do
			if war or war2 then
				repeat wait()
					SCROLLFARM()
					SCROLLFARM1()
				until not scrollfarm or not war or not war2
			end
		end
	end)
	spawn(function()
		while wait() do
			if war then
				pcall(function()
					refresh:Refresh("War Completed: " .. count)
					refreshC:Refresh("Round: " .. workspace.warserver.round.Value)
				end)
				for i,v in pairs(workspace.npc:GetChildren()) do
					if workspace.warserver:FindFirstChild("zetsu").Value > 0 and string.find(workspace.warserver.text.Value, "Left") or string.find(workspace.warserver.text.Value, "DEFEAT") and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
						wait(.2)
						pcall(function()
							v.Humanoid.Health = 0
						end)
					elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
						wait(6)
						pcall(function()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position))
							v.Humanoid.Health = 0
						end)
					end
				end
				if reset then
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
							wait(5)
							player.Character:BreakJoints()
							repeat wait()
							until v.round.Value == 0
							count = count + 1
						end
					end
				end
			end
		end
	end)
	
	spawn(function()
		while wait() do
			if war2 then
				refresh:Refresh("War Completed: " .. count)
				refreshC:Refresh("Round: " .. workspace.warserver.round.Value)
				for i,v in pairs(workspace.npc:GetChildren()) do
					if workspace.warserver:FindFirstChild("zetsu").Value > 0 and string.find(workspace.warserver.text.Value, "Left") or string.find(workspace.warserver.text.Value, "DEFEAT") and v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and not v:FindFirstChild("megaboss") then
						pcall(function()
							repeat wait()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-12,0)))
							wait(.3)
							v.Humanoid.Health = 0
							until v.Humanoid.Health == 0
						end)
					elseif v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Head.CFrame.Y > -1000 and v:FindFirstChild("megaboss") then
						wait(8)
						pcall(function()
							toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
							v.Humanoid.Health = 0
						end)
					else
						wait()
					end
				end
				if reset then
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "warserver" and v:FindFirstChild("round").Value > 20 then
							wait(5)
							player.Character:BreakJoints()
							repeat wait()
							until v.round.Value == 0
							count = count + 1
						end
					end
				end
			end
		end
	end)

	local function JINFARM()
		for i,v in pairs(game:GetService("Workspace").npc:GetChildren()) do
			if v.Name == "npc1" then
				repeat wait()
					pcall(function()
						toTarget(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,v.HumanoidRootPart.Position,CFrame.new(v.HumanoidRootPart.Position+Vector3.new(0,-25,0)))
						player.Character.combat.update:FireServer("mouse1", true)
						wait(.1)
						v.Humanoid.HealthChanged:Connect(function()
    						v.Humanoid.Health = 0
    					end)
					end)
				until v.Humanoid.Health == 0 or not jinfarm
			end
		end
	end
	spawn(function()
		while wait() do
			if jinfarm then
				JINFARM()
			end
		end
	end)
	spawn(function()
		while wait() do
			if RANKUP and player.statz.lvl:FindFirstChild("lvl").Value == 1000 then
				repeat wait()
					game.Players.LocalPlayer.startevent:FireServer("rankup")
				until player.statz.lvl:FindFirstChild("lvl").Value == 1 or not RANKUP
			end
		end
	end)
	
--Four page
if game.PlaceId == menuplace then
local inf = venyx:addPage("Auto spins", 6035161534)
local spin = inf:addSection("Auto spin")

	--main menu
	local kgs = {}
	for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
		if v:FindFirstChild("KG") then
			table.insert(kgs, v.Name)
		end
	end
	
	local b
	local kgslot
	local kgvalue
	spin:addDropdown("KG SLOT",{"kg1", "kg2", "kg3", "kg4"},function(kgS)
		b = kgS
		kgslot = game.Players.LocalPlayer.statz.main:FindFirstChild(b)
		kgvalue = kgslot.Value
		print(kgslot)
		print(kgvalue)
	end)
	local a1
	spin:addDropdown("KG Select",kgs,function(KG1)
		print("Selected: " .. KG1)
		a1 = KG1
	end)
	local a2
	spin:addDropdown("KG Select",kgs,function(KG2)
		print("Selected: " .. KG2)
		a2 = KG2
	end)
	local a3
	spin:addDropdown("KG Select",kgs,function(KG3)
		print("Selected: " .. KG3)
		a3 = KG3
	end)
	local a4
	spin:addDropdown("KG Select",kgs,function(KG4)
		print("Selected: " .. KG4)
		a4 = KG4
	end)
	local a5
	spin:addDropdown("KG Select",kgs,function(KG5)
		print("Selected: " .. KG5)
		a5 = KG5
	end)
	spin:addButton("Start Spin KG",function()
		kgslot.ChildAdded:Connect(function(yes)
            if yes.Name == "dontspin" then
                wait(.1)
                yes:Destroy()
            end
		end)
    
		local spins = game.Players.LocalPlayer.statz.spins.Value
		local des = game.Players.LocalPlayer.statz.spins
        spawn(function()
            for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
            	if v:FindFirstChild("KG") then
                    local a = Instance.new("StringValue")
                    a.Name = v.Name
                    a.Parent = game.Players.LocalPlayer.statz.genkailevel
            	end
            end
        end)
        
		spawn(function()
		    while wait() do
		        if spins > 0 then
            		spins = game.Players.LocalPlayer.statz.spins.Value
            		kgvalue = kgslot.Value
            		print("Rolled: " .. kgvalue)
            		if kgvalue ~= a1 and kgvalue ~= a2 and kgvalue ~= a3 and kgvalue ~= a4 and kgvalue ~= a5 then
            		    kgvalue = kgslot.Value
            			game.Players.LocalPlayer.startevent:FireServer("spin", b)
            			wait(.2)
            			kgvalue = kgslot.Value
            		else
            		    print("You have got: " .. kgvalue)
            		end
                else
                    player.statz.spins:Destroy()
                    game:GetService('TeleportService'):Teleport(game.PlaceId, player)
		        end
		    end
		end)
	end)

	spin:addButton("Reset Spin NOW",function()
        player.statz.spins:Destroy()
        game:GetService('TeleportService'):Teleport(game.PlaceId, player)	 
    end)
end
--Teleport tab
local Teleport = venyx:addPage("Teleport", 7061398829)
local TeleportFunction = Teleport:addSection("Teleport Function")

TeleportFunction:addToggle("Ctrl + Click = TP",false,function(vu)
    CTRL = vu
 end)

TeleportFunction:addButton("More coming soon")

--Misc Tab
local Misc = lib:addPage("Misc", 6034900727)
local RSFunction = Misc:addSection("Misc")
local LocalPlayer = game:GetService'Players'.LocalPlayer

function isnil(thing)
    return (thing == nil)
 end
 local function round(n)
    return math.floor(tonumber(n) + 0.5)
 end
 Number = math.random(1, 1000000)
 function UpdatePlayerChams()
    for i,v in pairs(game:GetService'Players':GetChildren()) do
       pcall(function()
          if not isnil(v.Character) then
             if ESPPlayer then
                if not isnil(v.Character.Head) and not v.Character.Head:FindFirstChild('NameEsp'..Number) then
                   local bill = Instance.new('BillboardGui',v.Character.Head)
                   bill.Name = 'NameEsp'..Number
                   bill.ExtentsOffset = Vector3.new(0, 1, 0)
                   bill.Size = UDim2.new(1,200,1,30)
                   bill.Adornee = v.Character.Head
                   bill.AlwaysOnTop = true
                   local name = Instance.new('TextLabel',bill)
                   name.Font = "GothamBold"
                   name.FontSize = "Size14"
                   name.TextWrapped = true
                   name.Text = (v.Name ..' \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                   name.Size = UDim2.new(1,0,1,0)
                   name.TextYAlignment = 'Top'
                   name.BackgroundTransparency = 1
                   name.TextStrokeTransparency = 0.5
                   if v.Team == game.Players.LocalPlayer.Team then
                      name.TextColor3 = Color3.new(0,255,0)
                   else
                      name.TextColor3 = Color3.new(255,0,0)
                   end
                else
                   v.Character.Head['NameEsp'..Number].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude/3) ..' M')
                end
             else
                if v.Character.Head:FindFirstChild('NameEsp'..Number) then
                   v.Character.Head:FindFirstChild('NameEsp'..Number):Destroy()
                end
             end
          end
       end)
    end
 end
 
 RSFunction:addToggle("ESP Player",false,function(a)
	ESPPlayer = a
	while ESPPlayer do wait()
	   UpdatePlayerChams()
	end
 end)

 RSFunction:addToggle("Auto Click",false,function(value)
	AuctoClick = value
	getgenv().C = value
	if getgenv().C == false then return end 
	while getgenv().C do wait()
	   game:GetService'VirtualUser':CaptureController()
	   game:GetService'VirtualUser':Button1Down(Vector2.new(1240, 372))
	   game:GetService'VirtualUser':CaptureController()
	   game:GetService'VirtualUser':Button1Down(Vector2.new(1230, 652))
	   game:GetService'VirtualUser':CaptureController()
	   game:GetService'VirtualUser':Button1Down(Vector2.new(1250, 252))
	   game:GetService'VirtualUser':CaptureController()
	   game:GetService'VirtualUser':Button1Down(Vector2.new(1260, 282))
	end
 end)

 RSFunction:addTextbox("Change the message!!", false, function(m)
	chat = m
 end)

 RSFunction:addToggle("Spam Message!!",false,function(s)
	_G.A = s
	if _G.A == false then return end 
	while _G.A do wait(.1)
	   local ohString1 = chat 
	   local ohString2 = "All"
	   game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
	end
 end)

 RSFunction:addToggle("Highlight Mode",false,function(t)
	getgenv().HighlightMode = t
	if getgenv().HighlightMode  == false then return end 
	while getgenv().HighlightMode do wait()
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = true
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = true
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = false
	   game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = false
	   if not getgenv().HighlightMode  then
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Beli.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.HP.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Energy.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.StatsButton.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.ShopButton.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Skills.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Level.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.MenuButton.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Code.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Settings.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Mute.Visible = true
		  game:GetService("Players")["LocalPlayer"].PlayerGui.Main.CrewButton.Visible = true
	   end
	end
 end)

 Fly = false  
speedSET = 25
function activatefly()
   local mouse=game.Players.LocalPlayer:GetMouse''
   localplayer=game.Players.LocalPlayer
   game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
   local torso = game.Players.LocalPlayer.Character.HumanoidRootPart
   local keys={a=false,d=false,w=false,s=false}
   local e1
   local e2
   local function start()
      local pos = Instance.new("BodyPosition",torso)
      local gyro = Instance.new("BodyGyro",torso)
      pos.Name="EPIXPOS"
      pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
      pos.position = torso.Position
      gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
      gyro.cframe = torso.CFrame
      repeat
         wait()
         localplayer.Character.Humanoid.PlatformStand=true
         local new=gyro.cframe - gyro.cframe.p + pos.position
         if not keys.w and not keys.s and not keys.a and not keys.d then
            speed=1
         end
         if keys.w then
            new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
            speed=speed+speedSET
         end
         if keys.s then
            new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
            speed=speed+speedSET
         end
         if keys.d then
            new = new * CFrame.new(speed,0,0)
            speed=speed+speedSET
         end
         if keys.a then
            new = new * CFrame.new(-speed,0,0)
            speed=speed+speedSET
         end
         if speed>speedSET then
            speed=speedSET
         end
         pos.position=new.p
         if keys.w then
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*90),0,0)
         elseif keys.s then
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*90),0,0)
         else
            gyro.cframe = workspace.CurrentCamera.CoordinateFrame
         end
      until not Fly
      if gyro then 
         gyro:Destroy() 
      end
      if pos then 
         pos:Destroy() 
      end
      flying=false
      localplayer.Character.Humanoid.PlatformStand=false
      speed=0
   end
   e1=mouse.KeyDown:connect(function(key)
      if not torso or not torso.Parent then 
         flying=false e1:disconnect() e2:disconnect() return 
      end
      if key=="w" then
         keys.w=true
      elseif key=="s" then
         keys.s=true
      elseif key=="a" then
         keys.a=true
      elseif key=="d" then
         keys.d=true
      end
   end)
   e2=mouse.KeyUp:connect(function(key)
      if key=="w" then
         keys.w=false
      elseif key=="s" then
         keys.s=false
      elseif key=="a" then
         keys.a=false
      elseif key=="d" then
         keys.d=false
      end
   end)
   start()
end

RSFunction:addToggle("Fly (Broken)",false,function(Value)
  Fly = Value
  activatefly()
end)

RSFunction:addSlider("Fly Speed",speedSET,10,100,function(Value)
   speedSET = Value
end)

RSFunction:addToggle("No Clip",false,function(t)
  if t == true then
  _G.conn = game:GetService("RunService").Stepped:Connect(function()
     for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
           v.CanCollide = false    
        end
     end
   end)
  else
   _G.conn:Disconnect()
  end
end)

--Five page
local page5 = venyx:addPage("Discord", 5012544693)
local Discord = page5:addSection("Mission Farm")

Discord:addButton("Copy Discord Link", function()
    setclipboard("https://discord.gg/64QjKpdjgz")
    venyx.Notify("Discord link added to your clicpboard")
end)

-- Theme page
local settings = venyx:addPage("Settings", 5012544693)
local colors = settings:addSection("Colors")
local setting = settings:addSection("Settings")

function Teleport()
    while game:GetService("RunService").RenderStepped:wait() do
       pcall(function()
          TPReturner()
          if foundAnything ~= "" then
             TPReturner()
          end
       end)
    end
 end

setting:addButton("Rejoin",function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
 end)

setting:addButton("Teleport to lower server",function()
   getgenv().AutoTeleport = true
   getgenv().DontTeleportTheSameNumber = true 
   getgenv().CopytoClipboard = false
   
   if not game:IsLoaded() then
       print("Game is loading waiting...| Corrupt's Empty Server Finder")
   end
   local maxplayers = math.huge
   local serversmaxplayer;
   local goodserver;
   local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
   
   function serversearch()
       for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
           if type(v) == "table" and v.playing ~= nil and maxplayers > v.playing then
               serversmaxplayer = v.maxPlayers
               maxplayers = v.playing
               goodserver = v.id
           end
       end
       print("Currently checking the servers with max this number of players : " .. maxplayers .. " | Corrupt's Empty Server Finder")
   end
   
   function getservers()
       serversearch()
       for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
           if i == "nextPageCursor" then
               if gamelink:find("&cursor=") then
                   local a = gamelink:find("&cursor=")
                   local b = gamelink:sub(a)
                   gamelink = gamelink:gsub(b, "")
               end
               gamelink = gamelink .. "&cursor=" ..v
               getservers()
           end
       end
   end
   
   getservers()
   
       print("All of the servers are searched") 
      print("Server : " .. goodserver .. " Players : " .. maxplayers .. "/" .. serversmaxplayer .. " | Corrupt's Empty Server Finder")
       if CopytoClipboard then
       setclipboard(goodserver)
       end
       if AutoTeleport then
           if DontTeleportTheSameNumber then 
               if #game:GetService("Players"):GetPlayers() - 4  == maxplayers then
                   return warn("It has same number of players (except you)")
               elseif goodserver == game.JobId then
                   return warn("Your current server is the most empty server atm") 
               end
           end
           print("AutoTeleport is enabled. Teleporting to : " .. goodserver)
           game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
       end
end)

setting:addButton("Delete Ui",function()
    local ui = game:GetService("CoreGui"):FindFirstChild("Lynzv-CX | Blox Fruit")
    if ui then
        venyx.Notify("The ui will be destroyed in three seconds")
       ui:Destroy()
    end
 end)

setting:addButton("Server Hop",function()
    Teleport()
end)

setting:addToggle("Autofarm : Magnet",getgenv().Magnet,function(Value)
	getgenv().Magnet = Value
   if getgenv().Magnet then
      Mode = "Magnet"
   else
      Mode = "Back"
   end
end)
setting:addToggle("AutoFarm Click",getgenv().AutoFarmClick,function(Value)
	getgenv().AutoFarmClick = Value
end)

setting:addToggle("Refresh Mob if it took too long(Soon)",getgenv().MobRefresh,function(value)
	getgenv().MobRefresh = value
end)

setting:addToggle("MobAura: Magnet",getgenv().MobAuraBring,function(value)
   getgenv().MobAuraBring = value
end)

setting:addKeybind("Hide UI", Enum.KeyCode.RightControl, function()
    print("Activated Keybind")
    venyx:toggle()
    end, function()
    print("Changed Keybind")
end)

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
    colors:addColorPicker(theme, color, function(color3)
    venyx:setTheme(theme, color3)
    end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)

venyx:Notify("Loaded")
wait(0.1)
venyx:Notify("UI made by venyx.")
wait(3)
venyx.Notify("Script made by Corrupt.")
