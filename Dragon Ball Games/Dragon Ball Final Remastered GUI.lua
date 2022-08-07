local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()

-- Library:CreateTab("Title", "Description", true/false (black, white))
-- CreateTab:CreateDropDown("Title", {"Name1", "Name2"}, function(arg)
-- CreateDropdown:AddButton("Title", function()
-- CreateDropdown:AddSlider(text, default, callback)
-- CreateDropdown:AddKeybind(text, default, callback)
-- CreateDropdown:CreateToggle(text, default, callback)

local plr = game:GetService("Players").LocalPlayer
local char = plr.character

local maintab = Library:CreateTab("DBFR GUI", "Made by: Bobsie", true)
local farm = Library:CreateTab("Autofarms", "Farming Featurtes", true)
local tp = Library:CreateTab("Teleports", "Locations",true)

maintab:CreateButton("Unlock All Gamepasses", function()
	local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
	local Args = {...}
	local method = getnamecallmethod()
	if not checkcaller() and method == "UserOwnsGamePassAsync" and Args[2] == 1054636518 or Args[2] == 2296867 or Args[2] == 1362733 then
		return true
	end
		return OldNameCall(Self, ...)
end))
end)

maintab:CreateButton("Infinite Zeni", function()
    while wait() do
        plr.Data.Moneys.Value = math.huge
    end
end)



maintab:CreateButton("Remove Name", function()
    while wait() do
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
           if v.ClassName == "BillboardGui" then
               v:Destroy()
           end
        end
    end
end)

maintab:CreateToggle("Infinite Ki", function(arg)
    if arg then
        getgenv().ki = true
        while getgenv().ki do 
            wait()
            plr.Data.Ki.Value = plr.Data.MaxKi.Value
        end
    else
        getgenv().ki = false
    end
end)

maintab:CreateToggle("Infinite Stamina", function(arg)
    if arg then
        getgenv().stamina = true
        while getgenv().stamina do 
            wait()
            plr.Data.Stamina.Value = plr.Data.MaxStamina.Value
        end
    else
        getgenv().stamina = false
    end
end)

farm:CreateButton("Teleport to HTC", function()
    game:GetService("TeleportService"):Teleport(4178935231, plr)
end)
farm:CreateButton("Teleport to Gravity Chamber", function()
    game:GetService("TeleportService"):Teleport(5798060869, plr)
end)

farm:CreateButton("Level Farm (Must be in HTC)", function()
    local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
plr.PlayerGui.Timer:Destroy()
        local runService = game:GetService("RunService")
        local heart
        heart = runService.Heartbeat:Connect(function()
            char.Humanoid.Health = 100
        local v1 = "صيحCorrectصيح"
        local rem = game:GetService("ReplicatedStorage").Remotes.Meditation
        rem:FireServer(v1)
        end)
end)

farm:CreateToggle("Auto Minigame (HTC)", function(arg)
    if arg then 
            local VirtualUser = game:service'VirtualUser'
game:GetService("Players").LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
plr.PlayerGui.Timer:Destroy()
        getgenv().minigame = true

wait(5)

local plr = game:GetService("Players").LocalPlayer
if iswindowactive() then
    while getgenv().minigame do 
        wait()
if string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key1").Text, "W") then
    keypress(0x57)
    wait(0.1)
    keyrelease(0x57)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key1").Text, "A") then
    keypress(0x41)
    wait(0.1)
    keyrelease(0x41)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key1").Text, "S") then
    keypress(0x53)
    wait(0.1)
    keyrelease(0x53)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key1").Text, "D") then
    keypress(0x44)
    wait(0.1)
    keyrelease(0x44)
end
if string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key2").Text, "W") then
    keypress(0x57)
    wait(0.1)
    keyrelease(0x57)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key2").Text, "A") then
    keypress(0x41)
    wait(0.1)
    keyrelease(0x41)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key2").Text, "S") then
    keypress(0x53)
    wait(0.1)
    keyrelease(0x53)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key2").Text, "D") then
    keypress(0x44)
    wait(0.1)
    keyrelease(0x44)
end
if string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key3").Text, "W") then
    keypress(0x57)
    wait(0.1)
    keyrelease(0x57)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key3").Text, "A") then
    keypress(0x41)
    wait(0.1)
    keyrelease(0x41)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key3").Text, "S") then
    keypress(0x53)
    wait(0.1)
    keyrelease(0x53)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key3").Text, "D") then
    keypress(0x44)
    wait(0.1)
    keyrelease(0x44)
end
if string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key4").Text, "W") then
    keypress(0x57)
    wait(0.1)
    keyrelease(0x57)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key4").Text, "A") then
    keypress(0x41)
    wait(0.1)
    keyrelease(0x41)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key4").Text, "S") then
    keypress(0x53)
    wait(0.1)
    keyrelease(0x53)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key4").Text, "D") then
    keypress(0x44)
    wait(0.1)
    keyrelease(0x44)
end
end
end
else
    getgenv().minigame = false
end
end)

farm:CreateToggle("Auto Minigame (GC)", function(arg)
    if arg then 
        local VirtualUser = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
getgenv().minigame2 = true

wait(5)
if iswindowactive() then
while getgenv().minigame2 do
    char.Humanoid.Health = 100
    wait()
if string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key1").Text, "Q") then
keypress(0x51)
wait(0.1)
keyrelease(0x51)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key1").Text, "E") then
keypress(0x45)
wait(0.1)
keyrelease(0x45)  
end
if string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key2").Text, "Q") then
keypress(0x51)
wait(0.1)
keyrelease(0x51)
elseif string.match(plr.PlayerGui["u組み合わせff"]:WaitForChild("Key2").Text, "E") then
keypress(0x45)
wait(0.1)
keyrelease(0x45)
end
end
end
else 
    getgenv().minigame2 = false
end
end)

tp:CreateTextBox("NPC Name here", function(arg)
    if arg == "Bulma" then
        char.HumanoidRootPart.CFrame = CFrame.new(-10828.6846, 3.37121129, -6122.39893, 0.993163526, -1.20089705e-09, -0.116731457, 2.67295763e-09, 1, 1.24541151e-08, 0.116731457, -1.26809905e-08, 0.993163526)
    elseif arg == "Future Gohan" then
        char.HumanoidRootPart.CFrame = CFrame.new(-890.269592, 2.99999928, 720.050537, -0.948231459, 5.89036233e-08, -0.317580074, 3.72118052e-08, 1, 7.43693391e-08, 0.317580074, 5.8701616e-08, -0.948231459)
    elseif arg == "Shop keeper" then
        char.HumanoidRootPart.CFrame = CFrame.new(2149.13721, 2.99999928, -5602.53027, -0.921806812, -8.32959746e-09, 0.387649566, 2.41527971e-08, 1, 7.89213033e-08, -0.387649566, 8.21130186e-08, -0.921806812)
    elseif arg == "Goku" then
        char.HumanoidRootPart.CFrame = CFrame.new(-3541.62524, 3.08999944, -5547.32275, 0.979866266, 6.97158029e-08, 0.199654847, -5.0895963e-08, 1, -9.93943488e-08, -0.199654847, 8.72315411e-08, 0.979866266)
    elseif arg == "Baba" then
        char.HumanoidRootPart.CFrame = CFrame.new(-1369.8407, 8.50717068, 720.654114, -0.872490346, 3.42613271e-09, -0.488631338, 2.01428718e-09, 1, 3.41502204e-09, 0.488631338, 1.9953299e-09, -0.872490346)
    elseif arg == "Vegeta" then
        char.HumanoidRootPart.CFrame = CFrame.new(-10708.6631, 3.18801427, -6121.51709, 0.0817832574, 1.06181957e-07, 0.996650159, -4.92349201e-08, 1, -1.02498724e-07, -0.996650159, -4.06873113e-08, 0.0817832574)
    elseif arg == "Iggi" then
        char.HumanoidRootPart.CFrame = CFrame.new(-8759.58887, 3.32895303, -6197.61621, -0.998227239, -2.27728103e-09, 0.0595180728, 5.30659516e-10, 1, 4.71621426e-08, -0.0595180728, 4.71101167e-08, -0.998227239)
    elseif arg == "Tien" then
        char.HumanoidRootPart.CFrame = CFrame.new(-2597.98047, 171.040588, -630.838135, 0.00240559294, 1.87157152e-08, 0.999997079, -2.98155478e-09, 1, -1.87085973e-08, -0.999997079, -2.93654079e-09, 0.00240559294)
    elseif arg == "Kid Gohan" then
        char.HumanoidRootPart.CFrame = CFrame.new(-10474.8359, 62.2770576, 1144.35986, -0.97873956, -5.62677442e-08, -0.205107033, -3.86923276e-08, 1, -8.96996681e-08, 0.205107033, -7.98565409e-08, -0.97873956)
    elseif arg == "Gogeta" then 
        char.HumanoidRootPart.CFrame = CFrame.new(-12370.459, 63.0808487, -4413.4458, -0.0587411597, 8.09554876e-08, 0.998273253, -1.62596407e-08, 1, -8.20522814e-08, -0.998273253, -2.10514095e-08, -0.0587411597)
    elseif arg == "Vegito" then
        char.HumanoidRootPart.CFrame = CFrame.new(-9960.67285, 136.499634, -5639.62891, 0.05957992, 2.69190483e-08, -0.998223543, 1.37086369e-08, 1, 2.77851662e-08, 0.998223543, -1.53397224e-08, 0.05957992)
    end
end)
