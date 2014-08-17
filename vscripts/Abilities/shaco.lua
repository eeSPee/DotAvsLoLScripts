function MakeClone(keys)
	local caster=keys.caster
	local playerowner = caster.GetPlayerOwner(caster)
	
	local Array = FindAllByName("npc_dota_hero_riki")
	print(table.getn(Array))
	for int=0,table.getn(Array) do
	local unit = Array[int]
	
		if unit:GetPlayerOwner(caster)==playerowner then
			local isTrue = unit:IsIllusion()
			local hasAbility = unit:FindAbilityByName("jester_isclone")
			if (isTrue==true and hasAbility~=nil) then
				print("found")
				AddAbility("jester_isclone")
				local nAbility=unit:FindAbilityByName("jester_isclone")
				nAbility:SetLevel(1)				
			
			end
		end
	
	end
end

function BackStab(keys)
	local caster=keys.caster
	local tarhet = keys.target
	
	local angleO=tarhet:EyeAngles()
	local angleMAX=angleO.y+90
	local angleMIN=angleO.y+270
	local angleT=caster:EyeAngles()
	
	local ability = keys.ability	
	local DMJ = (caster:GetAttackDamage())*ability:GetLevelSpecialValueFor("damagemult",ability:GetLevel())	
	
	if (angleT.y>=angleMIN and angleT.y<=angleMAX) then
	local damageTable = {
	victim = tarhet,
	attacker = caster,
	damage  = DMJ,
	damage_type = DAMAGE_TYPE_PHYSICAL,
	}
	ApplyDamage(damageTable)
	end
end
