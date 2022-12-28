--//Absolute bruh moment

game:GetService("Workspace").Loadstring:Destroy()

local old
old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if not checkcaller() and method == "Kick" then
        return wait(9e9)
        end
    return old(self, unpack(args))
end))

local old2
old2 = hookmetamethod(game, "__namecall", newcclosure(function(self2, ...)
    local args2 = {...}
    local method = getnamecallmethod()
    if not checkcaller() and method == "InvokeServer" and self2.Name == "Loadstring" and args2[1] == 6 then
        return wait(9e9)
        end
    return old2(self2, unpack(args2))
end))
