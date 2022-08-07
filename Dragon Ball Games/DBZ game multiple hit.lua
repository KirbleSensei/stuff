local target = game:GetService("ReplicatedStorage").Events.TryAttack

local OldNamecall
OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self,...)
    local Args = {...}
    local method = getnamecallmethod()
    if not checkcaller() and self == target and method == "FireServer" and Args[1].Type == "Light" then
        print("hit logged, repeating")
        for i = 1, 100 do
            OldNamecall(self, ...)
        end
    end
    return OldNamecall(self, ...)
end))