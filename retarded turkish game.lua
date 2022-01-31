--// Made by: Kirbles#0001

--// namecall hook lmao

local eventname = CheckEvent
local mt = getrawmetatable(game)
local backup = mt.__namecall

setreadonly(mt, false)

local Args = {...}
local Method = getnamecallmethod()

mt.__namecall = newcclosure(function(self, ...)
    if not checkcaller() and method == "FireServer" and self.Name == eventname then
    return wait(9e9)
end

return backup(self, ...)

end)

setreadonly(mt, true)

--// imagine handling bans on the client side  

local mt = getrawmetatable(game)

local old = mt.__namecall

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    if not checkcaller() and getnamecallmethod() == "Kick" or getnamecallmethod() == "kick" or getnamecallmethod() == "Ban" or getnamecallmethod() == "ban" then
        return wait(9e9)
    end

    return old(self, ...)

end)

setreadonly(mt, true)

local name = game:GetService('Players').LocalPlayer.Name

--// spam event

while true do
    wait()
for _,v in pairs(game.Players:GetChildren()) do
if v.Name ~= tostring(name) then

local message = "nice anti cheat niggers"

local args = {
    [1] = v.Character.Humanoid,
    [2] = 200,
    [3] = 200,
    [4] = 0,
    [5] = message
}

game:GetService("ReplicatedStorage").ACS_Engine.Eventos.Damage:FireServer(unpack(args))
end
end
end
