-- // Services
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local GroupService = game:GetService("GroupService")
local VirtualUser = game:GetService("VirtualUser")

-- // Vars
local Plr = Players.LocalPlayer
getgenv().autofarmtoggle = nil
getgenv().autocounter = nil
getgenv().selectedkey = nil

-- // Anti AFK
Plr.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    end)
-- // GUI Initialize  
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
-- FUNCTIONS:
local function customtwn(input, studspersecond, offset)
    local char = game:GetService("Players").LocalPlayer.Character;
    local input = input or error("input is nil");
    local studspersecond = studspersecond or 1000;
    local offset = offset or CFrame.new(0,0,0);
    local vec3, cframe;
 
    if typeof(input) == "table" then
        vec3 = Vector3.new(unpack(input)); cframe = CFrame.new(unpack(input));
    elseif typeof(input) ~= "Instance" then
        return error("wrong format used");
    end;
    
    Time = (char.HumanoidRootPart.Position - (vec3 or input.Position)).magnitude/studspersecond;
    local twn = game.TweenService:Create(char.HumanoidRootPart, TweenInfo.new(Time,Enum.EasingStyle.Linear), {CFrame = (cframe or input.CFrame) * offset});
    twn:Play();
    twn.Completed:Wait();
 end;

 local function GetClosestPlayer()
    local target = nil
    local distance = math.huge
  
    for i,v in next, Players:GetPlayers() do
        if v and v ~= Plr and v.Character and v.Character:FindFirstChildOfClass('Humanoid') and v.Character:FindFirstChildOfClass('Humanoid').RootPart then
            local plrdist = Plr:DistanceFromCharacter(v.Character:FindFirstChildOfClass('Humanoid').RootPart.CFrame.p)
            if plrdist < distance then
                target = v
                distance = plrdist
            end
        end
    end
  
    return target
 end

-- // Remote Bypass
--[[for i,v in pairs(getgc(true)) do
    if (type(v) == 'table' and rawget(v, 'Remote')) then
        v.Remote.Name = v.Name
    end
 end--]]
--// Remove table dupes
function RemoveTableDupes(tab)
	local hash = {}
	local res = {}
	for _,v in ipairs(tab) do
		if (not hash[v]) then
			res[#res+1] = v
			hash[v] = true
		end
	end
	return res
end

-- // Table creation
local playernames = {}
for i,v in pairs(Players:GetPlayers()) do
    table.insert(playernames, v.Name)
end
Players.PlayerAdded:Connect(function(addedplayer)
	table.insert(playernames, tostring(addedplayer))
end)
local npcs = {}
for i,v in pairs(Workspace:GetDescendants()) do
    if v:IsA("Model") and v:FindFirstChild("Humanoid") --[[and not table.find(playernames, v.Name)--]] then
        table.insert(npcs, v.Name)
		table.sort(npcs, function(a,b)
            return a < b
        end)
    end
end

local Window =
    Rayfield:CreateWindow(
    {
        Name = "Auto Farm",
        LoadingTitle = "W.I.P.",
        LoadingSubtitle = "by Kirbles#0329",
        ConfigurationSaving = {
            Enabled = false,
            FolderName = nil,
            FileName = ""
        },
        Discord = {
            Enabled = false,
            Invite = "",
            RememberJoins = true
        },
        KeySystem = false,
        KeySettings = {
            Title = "Login Key",
            Subtitle = "ddd",
            Note = "",
            FileName = "RF GUI Key",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = ""
        }
    }
)

local clienttab = Window:CreateTab("Client Features", 4483362458)

--[[local teleporttomarker = clienttab:CreateButton({
    Name = "Teleport to Quest",
    Callback = function()
    for i,v in pairs(game:GetService("Workspace").Terrain:GetChildren()) do
        if v:FindFirstChild("Marker") then
            customtwn(v, 150, CFrame.new(0,0,-5))
        end
    end
    end,
 })--]]

 local npcselect = clienttab:CreateDropdown({
    Name = "Farm Select",
    Options = RemoveTableDupes(npcs),
    CurrentOption = "None",
    Flag = "Dropdown1", 
    Callback = function(Option)
        getgenv().farmobject = tostring(Option)
    end,
 })

--[[local teleporttomarker = clienttab:CreateButton({
    Name = "Teleport to Chests",
    Callback = function()
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("Lock") then
            customtwn(v.Lock, 150)
            wait(1)
            fireproximityprompt(v.Inside.ProximityPrompt, 10)
            wait(2)
        end
    end
    end,
 }) ]]--

--[[ local autoquest = clienttab:CreateToggle({
    Name = "Auto Quest",
    CurrentValue = false,
    Flag = "autoquestflag",
    Callback = function(autoquest)
        if autoquest then
            getgenv().autoquesttoggle = true
            while getgenv().autoquesttoggle do
                task.wait()
                for i,v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("Model") and v.Name == getgenv().farmobject and v:FindFirstChild("Humanoid") then
                        if v.Humanoid.Health > 0 and Plr.Character:WaitForChild("Humanoid").Health > 0 then
                            Plr.Character.HumanoidRootPart.CFrame = v.WorldPivot
                            repeat 
                                task.wait()
                                Plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,6) -- * CFrame.Angles(math.rad(90),0,0)
                                v.HumanoidRootPart.Anchored = true
                                game:GetService("ReplicatedStorage").Communication.Events.TryPunch:FireServer()
                            until v.Humanoid.Health <= 0 or getgenv().autofarmtoggle == false
                        end
                    end
                end
            end
            else
                getgenv().autoquesttoggle = false
        end
    end,
}) ]]--

	local autofarm = clienttab:CreateToggle({
		Name = "Auto Farm",
		CurrentValue = false,
		Flag = "autofarmflag",
		Callback = function(toggle)
			if toggle then
				getgenv().autofarmtoggle = true
				while getgenv().autofarmtoggle do
					task.wait()
					for i,v in pairs(game.Workspace:GetDescendants()) do
						if v:IsA("Model") and v.Name == getgenv().farmobject and v:FindFirstChild("Humanoid") then
							if v.Humanoid.Health > 0 and Plr.Character:WaitForChild("Humanoid").Health > 0 then
								repeat 
									task.wait()
									Plr.Character:WaitForChild("HumanoidRootPart").CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5) -- * CFrame.Angles(math.rad(90),0,0)
									--v.HumanoidRootPart.Anchored = true
                                    game:GetService("ReplicatedStorage").Events.InputKey:FireServer("LMB")
								until v.Humanoid.Health <= 0 or getgenv().autofarmtoggle == false
							end
						end
					end
				end
				else
				    getgenv().autofarmtoggle = false
			end
		end,
	})

    local Input = clienttab:CreateInput({
        Name = "Counter Move Keybind",
        PlaceholderText = "Enter key here...",
        RemoveTextAfterFocusLost = false,
        Callback = function(keybind)
            getgenv().selectedkey = string.upper(tostring(keybind))
        end,
     })

    local autocounter = clienttab:CreateToggle({
		Name = "Auto Counter",
		CurrentValue = false,
		Flag = "autocounterflag",
		Callback = function(autocounter)
			if autocounter then
				getgenv().autocounter = true
                while getgenv().autocounter do
                    task.wait(0.4)
                    for i,v in pairs(GetClosestPlayer().Character.Torso:GetChildren()) do
                        if v:IsA("Sound") and v.Name ~= "Block" or v.Name ~= "Alert Indicator" then
                            game:GetService("ReplicatedStorage").Events.InputKey:FireServer(getgenv().selectedkey)
                        end
                    end
                end
				else
				    getgenv().autocounter = false
			end
		end,
	})

    --[[local freezenpcs = clienttab:CreateToggle({
		Name = "Freeze Npcs",
		CurrentValue = false,
		Flag = "freezenpcflag",
		Callback = function(freezenpc)
			if freezenpc then
				getgenv().freezenpctoggle = true
				while getgenv().freezenpctoggle do
					task.wait()
					for i,v in pairs(game.Workspace:GetDescendants()) do
						if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Name ~= Plr.Name then
                            v.HumanoidRootPart.Anchored = true
                        end
                    end
                end
				else
				    getgenv().freezenpctoggle = false
                    for i,v in pairs(game.Workspace:GetDescendants()) do
						if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Name ~= Plr.Name then
                            v.HumanoidRootPart.Anchored = false
                        end
                    end
			end
		end,
	})

    local itemfarm = clienttab:CreateToggle({
		Name = "Item Farm",
		CurrentValue = false,
		Flag = "itemfarmflag",
		Callback = function(itemfarm)
			if itemfarm then
                getgenv().ItemFarm = true 
                game:GetService("RunService").Stepped:connect(function()
                pcall(function()
            if ItemFarm then
          for _,v in pairs(game.Workspace:GetDescendants()) do
           if v:IsA("TouchTransmitter") then
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
               wait()
               firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
               end
           end
      end
  end)
end)
				else
				    getgenv().ItemFarm = false
			end
		end,
	})]]--



local Paragraph = clienttab:CreateParagraph({Title = "ddd", Content = "i love norweigan girls"})
