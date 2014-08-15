function BlinkToPoint(keys)
	local destination=keys.target_points[1]
	local unit=keys.caster
	unit:SetAbsOrigin(destination)
end

function RestoreMana(keys)
	local unit=keys.target
	local ManaAdd=keys.mana
	
	unit:GiveMana(ManaAdd)	
end