-- // Services
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local GroupService = game:GetService("GroupService")
local VirtualUser = game:GetService("VirtualUser")

-- // Vars
local Plr = Players.LocalPlayer

Plr.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    end)

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- // GUI Initialize
getgenv().autofarmtoggle = nil
getgenv().farmobject = nil

for i,v in pairs(getgc(true)) do
    if (type(v) == 'table' and rawget(v, 'Remote')) then
        v.Remote.Name = v.Name
    end
 end

local playernames = {}
for i,v in pairs(Players:GetPlayers()) do
    table.insert(playernames, v.Name)
end
Players.PlayerAdded:Connect(function(addedplayer)
	table.insert(playernames, tostring(addedplayer))
end)
local npcs = {}
for i,v in pairs(Workspace:GetDescendants()) do
    if v:IsA("Model") and v:FindFirstChild("Humanoid") and not table.find(playernames, v.Name) then
        table.insert(npcs, v.Name)
		table.sort(npcs, function(a,b)
            return a < b
        end)
    end
end

local Window =
    Rayfield:CreateWindow(
    {
        Name = "World of Stands GUI",
        LoadingTitle = "World of Stands",
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

local Dropdown = clienttab:CreateDropdown({
    Name = "Farm Select",
    Options = npcs,
    CurrentOption = "None",
    Flag = "Dropdown1", 
    Callback = function(Option)
        getgenv().farmobject = tostring(Option)
    end,
 })

	local Toggle = clienttab:CreateToggle({
		Name = "Auto Farm",
		CurrentValue = false,
		Flag = "autofarmflag",
		Callback = function(toggle)
			if toggle then
				getgenv().autofarmtoggle = true
				while getgenv().autofarmtoggle do
					task.wait()
					for i,v in pairs(game.Workspace:GetDescendants()) do
						if v:IsA("Model") and v.Name == getgenv().farmobject then
							if v.Humanoid.Health > 0 and Plr.Character.Humanoid.Health > 0 then
                                Plr.Character:WaitForChild("HumanoidRootPart").CFrame = v.WorldPivot
								repeat 
									task.wait()
									Plr.Character:WaitForChild("HumanoidRootPart").CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5) --* CFrame.Angles(math.rad(90),0,0)
									game:GetService("ReplicatedStorage").Communication.Events.TryPunch:FireServer()
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

local Paragraph = clienttab:CreateParagraph({Title = "ddd", Content = "i love norweigan girls"})
