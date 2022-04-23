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
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local venyx = library.CreateLib("Vellerius X | Shindo life", "Midnight")

--Two page
local Autofarm = venyx:NewTab("Autofarm")
local Farm = Autofarm:NewSection("Mission Farm")
local Scroll = Autofarm:NewSection("Scroll Farm")
getgenv().speed = 500


	local autofarm
	Farm:NewToggle("AutoFarm", "This function wil auto farm quests for you", function(v)
		autofarm = v
	end)

	local gift
    Farm:NewToggle("Farm Gift Box", "This function will auto get gifts for you!", function(v)
		gift = v
    end)
    
  	local RANKUP
    Farm:NewToggle("AutoRank", "This function will auto rank up for you!", function(v)
		RANKUP = v
    end)
    
    local jinfarm
    Scroll:NewToggle("Jin Farm", "This function will auto get jin scrolls for you!", function(v)
		jinfarm = v
    end)

    local scrollfarm
    Scroll:NewToggle("Scroll Farm", "This function will auto get scrolls for you!", function(v)
		scrollfarm = v
    end)
    

--Warmode Page
local warmodetab = venyx:NewTab("War Farm")
local warfarm = warmodetab:NewSection("Warmode")

local war
    warfarm:NewToggle("Warmode", nil, function(v)
	   war = v
	end)
	
    local reset
    warfarm:NewToggle("Reset round 21", nil, function(v)
        reset = v
    end)

--Three page
local Quest = venyx:NewTab("Quests Maker")
local d = Quest:NewSection("Quests Maker")

    d:NewToggle("Rush", "This function will automaticaly do rushes for you!",function(v)
        getgenv().Rush = v
        if getgenv().Rush then
            for i = 1,300 do
                game.Players.LocalPlayer.Character.combat.update:FireServer("rushw")
                wait(.25)
            end
        end
    end)

    d:NewToggle("Jumps", "This function will automaticaly do jumps for you!",function(v)
        getgenv().Punches = v
        if getgenv().Punches then
            for v = 1,300 do
                game.Players.LocalPlayer.Character.combat.update:FireServer("takemovement2")
                wait(.25)
            end
        end
    end)

    d:NewToggle("Chakra Charges", "This function will automaticaly charge your chakra!", function(v)
        getgenv().chakra = v
        if getgenv().chakra then
            for i = 1,500 do
                game.Players.LocalPlayer.Character.combat.update:FireServer("key","c")
                wait(.1)
                game.Players.LocalPlayer.Character.combat.update:FireServer("key","cend")
                wait(.5)
            end
		end
    end)

    d:NewToggle("Punches", "This will automaticaly do punches for you!",function(v)
        getgenv().Punches = v
        if getgenv().Punches then
            for i = 1,999 do
                game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1",true)
                wait(.3)
            end
        end
    end)

    d:NewButton("TP TrainLog", "This function will tp you to a training log!",function()
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
	
--Misc Tab
local Misc = venyx:NewTab("Misc")
local RSFunction = Misc:NewSection("Misc")
local LocalPlayer = game:GetService'Players'.LocalPlayer
 
 local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
 ESP:Toggle(true)
 ESP.Players = false
 ESP.Tracers = false
 ESP.Names = false

 RSFunction:NewToggle("Player ESP", "This function can let you toggle on the ESP feature!", function(value)
     ESP.Players = value
 end)

 RSFunction:NewToggle("Tracer ESP", "This function can let you trace all player!", function(value)
     ESP.Tracers = value    
 end)

 RSFunction:NewToggle("Names ESP", "This function can let you show all player username!", function(value)
     ESP.Names = value 
 end)

 RSFunction:NewToggle("Auto Click","This function lets you auto click for the autofarm!",function(value)
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

 RSFunction:NewTextBox("Change the message!!", "This function lets you type a message to spam!", function(m)
	chat = m
 end)

 RSFunction:NewToggle("Spam Message!!", "This function lets you spam the message you typed!",function(s)
	_G.A = s
	if _G.A == false then return end 
	while _G.A do wait(.1)
	   local ohString1 = chat 
	   local ohString2 = "All"
	   game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)
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

RSFunction:NewToggle("Fly", "This function will let you fly!", function(Value)
  Fly = Value
  activatefly()
end)

RSFunction:NewSlider("Fly Speed", "This slider will allow you to change you fly speed!",speedSET, 50,function(Value)
   speedSET = Value
end)

RSFunction:NewToggle("No Clip", "This function will enable no clip for you!",function(t)
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
local discord = venyx:NewTab("Discord")
local Discord = discord:NewSection("Discord")

Discord:NewButton("Copy Discord Link", "This function will set our discord link on your clipboard!", function()
    setclipboard("https://discord.gg/64QjKpdjgz")
end)

-- Theme page
local settings = venyx:NewTab("Settings")
local setting = settings:NewSection("Settings")

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

setting:addButton("Rejoin", "This function will let you rejoin!", function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
 end)

setting:NewButton("Teleport to lower server", "This function will teleport you to a server with under 3 players!",function()
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

setting:NewButton("Server Hop", "This function will teleport you to another server!",function()
    Teleport()
end)
