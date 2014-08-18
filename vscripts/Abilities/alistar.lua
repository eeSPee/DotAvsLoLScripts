function DashToTarget(keys)
    local targetPos = keys.target:GetAbsOrigin()
    local casterPos = keys.caster:GetAbsOrigin()
	local ability=keys.ability
		 
    local direction = targetPos - casterPos
    local vec = direction:Normalized() * ability:GetLevelSpecialValueFor("dashspeed",ability:GetLevel())

	keys.caster:SetAbsOrigin(casterPos + vec)
end
	
function calculatedistance(keys)
	local targetPos = keys.target:GetAbsOrigin()
    local casterPos = keys.caster:GetAbsOrigin()
	local ability=keys.ability
		
	local XX = targetPos.x - casterPos.x
	local YY = targetPos.z - casterPos.z
	local distance = math.sqrt ( XX * XX + YY * YY )	
	
	print(distance)
	
	if distance<=100 then
		keys.caster:RemoveModifierByName("alistar_charge")
		
		local info = 
		{
			Target = keys.target,
			Source = keys.caster,
			Ability = keys.ability,	
			EffectName = "",
			vSpawnOrigin = caster:GetAbsOrigin(),
			iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
			iUnitTargetFlags = DOTA_UNIT_TARGET_FLAG_NONE,
			iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,			
			bDeleteOnHit = true,
			vVelocity = 1800,
		}
		ProjectileManager:CreateTrackingProjectile(info)	
	end

end