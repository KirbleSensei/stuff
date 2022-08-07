local target = game:GetService("Workspace").Main.Live["Slayer_Kun"].Combat
local env = getsenv(target)
local Hook = hookfunction(env.MoveBodyPosition, function(...)
    warn("Check attempt.")-- I personally make it return wait(LARGE NUMBER) because lots of developers crash you after kicking you.
end)