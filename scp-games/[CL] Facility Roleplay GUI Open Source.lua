local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- // Services
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")

-- // Vars
local LocalPlayer = Players.LocalPlayer

--// afk hook? dunno if it works
local afkhook
afkhook =
    hookmetamethod(
    game,
    "__namecall",
    newcclosure(
        function(self, ...)
            local Args = {...}
            local method = getnamecallmethod()
            if not checkcaller() and self == game.Players.LocalPlayer and method == "GetAttribute" and Args[1] == "AFK" then
                return false
            end
            return afkhook(self, ...)
        end
    )
)

--// functions

local function norecoil(module)
    require(module).Recoil.Min = Vector3.new(0, 0, 0)
    require(module).Recoil.Max = Vector3.new(0, 0, 0)
end

local function infammo(module)
    require(module).Bullet.Capacity = 999999
end

local function superfire(module)
    require(module).Bullet.RPM = 2000
end

local function fullauto(module)
	require(module).Bullet.DefaultFireMode = "Auto"
end

-- // GUI Initialize

local Window =
    Rayfield:CreateWindow(
    {
        Name = "CL Facility Roleplay GUI",
        LoadingTitle = "CL Facility Roleplay",
        LoadingSubtitle = "by Bobsie (Kirbles#0378)",
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
            Title = "",
            Subtitle = "",
            Note = "",
            FileName = "",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = ""
        }
    }
)

local clienttab = Window:CreateTab("Client Features", 4483362458)

--// Combat
local Section = clienttab:CreateSection("Combat")

local norecoil =
    clienttab:CreateButton(
    {
        Name = "No Recoil",
        Callback = function()
            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("GunStatistics") then
                    norecoil(v.GunStatistics)
                end
            end
        end
    }
)

local infammo =
    clienttab:CreateButton(
    {
        Name = "Inf Ammo",
        Callback = function()
            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("GunStatistics") then
                    local mt = getrawmetatable(game)
                    local ammohook = mt.__namecall
                    defaultammo = require(v.GunStatistics).Bullet.Capacity
                    setreadonly(mt, false)
                    mt.__namecall =
                        newcclosure(
                        function(remote, ...)
                            args = {...}
                            method = tostring(getnamecallmethod())
                            if method == "InvokeServer" and tostring(remote) == "PreventDefaultGripWeld" then
                                args[2] = defaultammo
                                return ammohook(remote, unpack(args))
                            end
                            return ammohook(remote, ...)
                        end
                    )
                    setreadonly(mt, true)
                    infammo(v.GunStatistics)
                end
            end
        end
    }
)

local fullauto =
    clienttab:CreateButton(
    {
        Name = "Weapon Full Auto",
        Callback = function()
            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("GunStatistics") then
                    fullauto(v.GunStatistics)
                end
            end
        end
    }
)
local rpmmode =
    clienttab:CreateButton(
    {
        Name = "High Fire Rate",
        Callback = function()
            for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("GunStatistics") then
                    superfire(v.GunStatistics)
                end
            end
        end
    }
)
local refillarmor =
    clienttab:CreateButton(
    {
        Name = "Refill Armor",
        Callback = function()
            game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.VendorService.RF.BuyItem:InvokeServer("OC","Boosts", 2)
        end
    }
)
-- // Client
local clientsection = clienttab:CreateSection("Client")
local removename =
    clienttab:CreateButton(
    {
        Name = "Remove Name (Reset to fix)",
        Callback = function()
            LocalPlayer.Character.Head.NameTag:Destroy()
        end
    }
)
local instainteract =
    clienttab:CreateButton(
    {
        Name = "Instant Interaction",
        Callback = function()
            local interhook
            interhook =
                hookmetamethod(
                game,
                "__namecall",
                newcclosure(
                    function(self, ...)
                        local Args = {...}
                        local method = getnamecallmethod()
                        if not checkcaller() and method == "GetAttribute" and Args[1] == "InteractionDuration" then
                            return 0
                        elseif method == "GetAttribute" and Args[1] == "InteractionDisabled" then
                            return false
                        end
                        return interhook(self, ...)
                    end
                )
            )
        end
    }
)

-- // Visual
local visualtab = Window:CreateTab("Visual Features", 4483362458)
local Section2 = visualtab:CreateSection("ESP")
local Label2 = visualtab:CreateLabel("Credits to fate and misrepresenting")

local Button5 =
    visualtab:CreateButton(
    {
        Name = "ESP",
        Callback = function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/fatesc/fates-esp/main/main.lua"), true))()
        end
    }
)

-- // Farm
local farmtab = Window:CreateTab("Farm Features", 4483362458)
local Section = farmtab:CreateSection("EXP")
local Label = farmtab:CreateLabel("All credits go to Bob24 and Blockzez")
local Dropdown =
    farmtab:CreateDropdown(
    {
        Name = "GYM Equipment",
        Options = {"Treadmill", "Barbell", "PushUp", "PullUp"},
        CurrentOption = "None",
        Flag = "Dropdown1", 
        Callback = function(Option)
            if Option == "Treadmill" then
                getgenv().gymmethod = "Treadmill"
            elseif Option == "Barbell" then
                getgenv().gymmethod = "Barbell"
            elseif Option == "Pushup" then
                getgenv().gymmethod = "Pushup"
            elseif Option == "PullUp" then
                getgenv().gymmethod = "PullUp"
            end
        end
    }
)

local Button4 =
    farmtab:CreateButton(
    {
        Name = "GYM Farm",
        Callback = function()
            local runservice = game:GetService("RunService")
            local remote =
                game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.GymService.RF.RequestXP
            local toWorkOut = {
                "Treadmill",
                "Barbell",
                "PushUp",
                "PullUp"
            }
            local function workOut(toWork)
                remote:InvokeServer(toWork)
            end
            if getgenv().connection then
                getgenv().connection:Disconnect()
                return print("Disconnected")
            end
            getgenv().connection =
                runservice.RenderStepped:Connect(
                function()
                    workOut(getgenv().gymmethod) 
                end
            )
        end
    }
)

local Toggle =
    farmtab:CreateToggle(
    {
        Name = "Mail Farm",
        CurrentValue = false,
        Flag = "Toggle1", 
        Callback = function(Value)
            if Value == true then
                local workspace = game:GetService("Workspace")

                getgenv().toggle = true

                local function SendBox(Column, Row)
                    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.InteractionService.RF.FloatingInteract:InvokeServer(
                        "MailDeposit",
                        Column,
                        tonumber(Row)
                    )
                end

                local function getBox(handle)
                    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.InteractionService.RF.Interact:InvokeServer(
                        handle
                    )
                end

                local function getColumnAndRow(str)
                    local text = (str:gsub("(\\?)<[^<>]->", {[""] = ""})) 
                    local splitted = string.split(text, " ")
                    local column = string.sub(splitted[2], 1, 1)
                    local row = splitted[3]
                    return column, row
                end

                local function checkBox(obj)
                    if obj:IsA("Model") and obj.Name == "Mail Package" then 
                        if not obj:FindFirstChild("Handle") then 
                            return
                        end

                        local boxLabel = obj.Handle.InfoUI.TextLabel
                        local column, row = getColumnAndRow(boxLabel.Text)
                        getBox(obj.Handle)
                        task.wait()
                        SendBox(column, row)
                    end
                end
                while toggle do
                    task.wait()
                    for i, v in pairs(workspace:GetChildren()) do
                        checkBox(v)
                    end
                end
            elseif Value == false then
                getgenv().toggle = false
            end
        end
    }
)

local Paragraph =
    farmtab:CreateParagraph(
    {Title = "NOTE", Content = "For the Mail Farm to work it must be worktime AND you must be a research subject."}
)
