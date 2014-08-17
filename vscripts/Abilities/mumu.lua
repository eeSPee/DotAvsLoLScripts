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

function ReduceCooldown(keys,Scale)
	local caster=keys.caster
	local targ=keys.target
	local ability=keys.ability

	local reduction=ability:GetLevelSpecialValueFor("cdreduction",ability:GetLevel())
	local Time=ability:GetCooldownTimeRemaining()-reduction
	
	ability:EndCooldown()
	ability:StartCooldown(Time)	
end