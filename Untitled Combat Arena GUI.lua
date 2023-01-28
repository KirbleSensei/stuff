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
local npcs = {}
for i,v in pairs(Workspace:GetDescendants()) do
    if v:IsA("Model") and v:FindFirstChild("Humanoid") then
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
        LoadingSubtitle = "by Kirbles#5167",
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

 local npcselect = clienttab:CreateDropdown({
    Name = "Farm Select",
    Options = RemoveTableDupes(npcs),
    CurrentOption = "None",
    Flag = "Dropdown1", 
    Callback = function(Option)
        getgenv().farmobject = tostring(Option)
    end,
 })

	local autofarm = clienttab:CreateToggle({
		Name = "Auto Farm",
		CurrentValue = false,
		Flag = "autofarmflag",
		Callback = function(toggle)
			if toggle then
				getgenv().autofarmtoggle = true
				while getgenv().autofarmtoggle do
					task.wait()
					for i,v in pairs(Workspace:GetDescendants()) do
						if v:IsA("Model") and v.Name == getgenv().farmobject and v:FindFirstChild("Humanoid") then
							if v.Humanoid.Health > 0 and Plr.Character:WaitForChild("Humanoid").Health > 0 then
								repeat 
									task.wait()
									Plr.Character:WaitForChild("HumanoidRootPart").CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5) -- * CFrame.Angles(math.rad(90),0,0)
									--v.HumanoidRootPart.Anchored = true
                                    					RS.Events.InputKey:FireServer("LMB")
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
                            				RS.Events.InputKey:FireServer(getgenv().selectedkey)
                        				end
                    				end
                			end
				else
				    getgenv().autocounter = false
			end
		end,
	})

local Paragraph = clienttab:CreateParagraph({Title = "Note to self:", Content = "man im alone"})
