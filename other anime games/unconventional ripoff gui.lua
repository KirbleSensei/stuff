local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Project Baki 2 GUI", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = false})

--// VARIABLES ///////////////////////////////////////////////////////////////////////////////////
local Plr = game:GetService("Players").LocalPlayer

--///////////////////////////////////////////////////////////////////////////////////
local Tab1 = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local Section1 = Tab1:AddSection({
    Name = "Combat"
})
--KNOCKBACK ///////////////////////////////////////////////////////////////////////////////////
Tab2:AddButton({
    Name = "Hide Name",
    Callback = function()
        local noknockback
        noknockback = hookfunc(getrenv()._G.knockback, function()
    end)
    end
    
