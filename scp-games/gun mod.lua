for i,v in pairs(getgc(true)) do
	if type(v) == "table" and rawget(v,"Clip") then
	    rawset(v, "Clip", math.huge)
	    rawset(v, "Ammo",  math.huge)
	    rawset(v, "Spread", 0)
	    rawset(v, "Damage",  math.huge)
	    rawset(v, "TBS", 0.018)
	end
end
