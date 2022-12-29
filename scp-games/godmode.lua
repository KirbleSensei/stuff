--// works for class d 
while wait() do
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
   if v.ClassName == "BillboardGui" then
       v:Destroy()
   end
end
end
