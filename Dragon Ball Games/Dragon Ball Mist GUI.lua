local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()

-- Library:CreateTab("Title", "Description", true/false (black, white))
-- CreateTab:CreateDropDown("Title", {"Name1", "Name2"}, function(arg)
-- CreateDropdown:CreateButton("Title", function()
-- CreateDropdown:AddSlider(text, default, callback)
-- CreateDropdown:AddKeybind(text, default, callback)
-- CreateDropdown:CreateToggle(text, default, callback)

local plr = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")

local mt = getrawmetatable(game)
setreadonly(mt,false)
local backup = mt.__namecall
mt.__namecall = newcclosure(function(self,...)
    if getnamecallmethod() == "Kick" or getnamecallmethod() == "kick" then
        return
    end
    return backup(self,...)
end)
setreadonly(mt,true)
hookfunction(plr.Kick,newcclosure(function()
    return
end))

plr.PlayerGui.AutoTraining:Destroy()

local maintab = Library:CreateTab("Dragon Ball Mist GUI", "Made by: Bobsie", true)

maintab:CreateButton("Punch Farm", function()
    plr.CharacterAdded:connect(function()
    env = game:GetService("Players").LocalPlayer.PlayerGui.Punch
    local func
    for i,v in pairs(getgc()) do
       if type(v) == "function" and getfenv(v).script == env then
           func = v -- Get the function
       end
    end
    debug.setconstant(func, 53, 0)
end)
runService.RenderStepped:connect(function()
    local v1 = "1412qRsx0Pr%tect!on1412"
    local rem = game:GetService("ReplicatedStorage").Punch
    
    rem:FireServer(v1)
end)
end)

maintab:CreateButton("Energy Farm", function()
    plr.CharacterAdded:connect(function()
    s = plr.PlayerGui["KiBlast (Event)"]
local func
for i,v in pairs(getgc()) do
   if type(v) == "function" and getfenv(v).script == s then
       func = v -- Get the function
   end
end
debug.setconstant(func, 48, 0)
debug.setconstant(func, 60, 0)
end)

end)