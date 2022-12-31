-- // Services
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local GroupService = game:GetService("GroupService")
local VirtualUser = game:GetService("VirtualUser")

-- // Vars
local Plr = Players.LocalPlayer

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- // GUI Initialize
getgenv().gokutoggle = nil

local Window =
    Rayfield:CreateWindow(
    {
        Name = "Dragon Ball Evolution GUI",
        LoadingTitle = "Dragon Ball Evolution",
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

local clienttab = Window:CreateTab("Farm Features", 4483362458)

local teleport = clienttab:CreateButton({
	Name = "Teleport to HTC",
	Callback = function()
		game:GetService("TeleportService"):Teleport(5832683990, Plr)
	end,
})

if game.PlaceId == 5832683990 then
	
Plr.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)

	local Toggle = clienttab:CreateToggle({
		Name = "Farm Goku",
		CurrentValue = false,
		Flag = "gokufarm",
		Callback = function(toggle)
			if toggle then
				getgenv().gokutoggle = true
				while getgenv().gokutoggle do
					task.wait()
					for i,v in pairs(game.Workspace:GetChildren()) do
						if v:IsA("Model") and v.Name == "Goku - SSJB  KKx10" then
							if v.Humanoid.Health > 0 and Plr.Character.Humanoid.Health > 0 then
								repeat 
									task.wait()
									Plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
									game:GetService("ReplicatedStorage").Combat:FireServer("normal1")
								until v.Humanoid.Health <= 0 or getgenv().gokutoggle == false
							end
						end
					end
				end
				else
				    getgenv().gokutoggle = false
			end
		end,
	})
end

local Paragraph = clienttab:CreateParagraph({Title = "ddd", Content = "i love norweigan girls"})
