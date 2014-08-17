function BlinkToPoint(keys)
	local destination=keys.target_points[1]
	local unit=keys.caster
	local pos=GetGroundPosition(destination,unit)
	unit:SetAbsOrigin(pos)
end

function RestoreMana(keys)
	local unit=keys.target
	local ManaAdd=keys.mana
	
	unit:GiveMana(ManaAdd)	
end

function dealdamagebasedonabilitypower(keys,Scale)
	local caster=keys.caster
	local target = keys.target	
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local AP = Data.AbilityPower or 0
	
	local damageTable = {
	victim = target,
	attacker = caster,
	damage  = AP*Scale,
	damage_type = DAMAGE_TYPE_MAGIC,
	}
	ApplyDamage(damageTable)
end

function scrapelifebasedonabilitypowerHUNDREDS(keys,Scale)
	local caster=keys.caster
	local target = keys.target	
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local AP = Data.AbilityPower or 0
	
	local varA=target:GetMaxHealth()/100
	local varB=math.floor(AP/100)*Scale
		
	local DMJ = (varA)*varB	
	
	local damageTable = {
	victim = target,
	attacker = caster,
	damage  = DMJ,
	damage_type = DAMAGE_TYPE_MAGIC,
	}
	ApplyDamage(damageTable)
end

function updateAP(keys)
	local caster=keys.caster
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local AP = 0

	if caster:HasItemInInventory("item_filler")==true then
	AP=AP+1
	end
	
	Data.AbilityPower=AP

end