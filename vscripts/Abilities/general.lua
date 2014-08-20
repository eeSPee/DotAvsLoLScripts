function BlinkToPoint(keys)
	local destination=keys.target_points[1]
	local unit=keys.caster
	local pos=GetGroundPosition(destination,unit)
	unit:SetAbsOrigin(pos)
end

function RestoreMana(keys)
	local unit=keys.caster
	local ManaAdd=keys.mana
	
	unit:GiveMana(ManaAdd)	
end

function dealmagicdamagebasedonabilitypower(keys)
	local caster=keys.caster
	local target = keys.target	
	local Scale= keys.apscale
	local Data = GameData:For("DataCounter",caster:GetPlayerOwner())
	local AP = Data.AbilityPower or 0
	local DMJ=AP*Scale
	local Type=keys.type or DAMAGE_TYPE_MAGICAL
	
	local damageTable = {
	victim = target,
	attacker = caster,
	damage  = DMJ,
	damage_type = Type,
	}
	ApplyDamage(damageTable)
	
	print(DMJ)
	print(Type)
end

function dealmagicdamagebasedonattackdamage(keys)
	local caster=keys.caster
	local target = keys.target	
	local Scale= keys.dmjscale
	local AP = caster:GetAttackDamage()
	local DMJ=AP*Scale
	local Type=keys.type or DAMAGE_TYPE_PHYSICAL
	
	local damageTable = {
	victim = target,
	attacker = caster,
	damage  = DMJ,
	damage_type = Type,
	}
	ApplyDamage(damageTable)
end

function DamagePerLife(keys)
	local caster=keys.caster
	local targ=keys.target
	local ability=keys.ability
	
	local varA=targ:GetMaxHealth()
	local varB=ability:GetLevelSpecialValueFor("damagemult",ability:GetLevel())
		
	local DMJ = (varA)*varB/100	
	
	local damageTable = {
	victim = targ,
	attacker = caster,
	damage = DMJ,
	damage_type = DAMAGE_TYPE_MAGICAL,
	}
	ApplyDamage(damageTable)	
end

function DashToTarget(keys)
    local targetPos = keys.target:GetAbsOrigin()
    local casterPos = keys.caster:GetAbsOrigin()
	local ability=keys.ability
		 
    local direction = targetPos - casterPos
    local vec = direction:Normalized() * ability:GetLevelSpecialValueFor("dashspeed",ability:GetLevel())
	
	keys.caster:SetAbsOrigin(casterPos + vec)
end

function ReduceCooldown(keys)
	local caster=keys.caster
	local ability=keys.ability

	local reduction=ability:GetLevelSpecialValueFor("cdreduction",ability:GetLevel())
	local Time=ability:GetCooldownTimeRemaining()-reduction
	
	ability:EndCooldown()	
	ability:StartCooldown(Time)	
end

function ResetCoolDown(keys)
	local caster=keys.caster
	local ability=keys.ability
	
	local Time=ability:GetCooldown()
	
	ability:EndCooldown()	
	ability:StartCooldown(Time)	
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
