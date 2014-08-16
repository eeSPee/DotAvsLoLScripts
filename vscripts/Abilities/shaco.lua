function MakeClone(keys)
	local caster=keys.caster
	local playerowner = caster.GetPlayerOwner(caster)
	local Point = caster:GetCenter()
	
	local unit=CreateHeroForPlayer ("npc_dota_hero_shaco",nil)
	
	if unit~=nil then
	unit:SetControllableByPlayer(playerowner:GetPlayerID(), true)
	
	local ability1=caster:GetAbilityByName("jester_blink")
	local ability1origin=unit:GetAbilityByName("jester_blink")
	ability1origin:SetLevel(ability1origin:GetLevel())	
			
	local ability2=caster:GetAbilityByName("jester_trap")
	local ability2origin=unit:GetAbilityByName("jester_trap")	
	ability2origin:SetLevel(ability2origin:GetLevel())
	
	
	local ability3=caster:GetAbilityByName("jester_shiv")	
	local ability3origin=unit:GetAbilityByName("jester_shiv")
	ability3origin:SetLevel(ability3origin:GetLevel())
	
	local ability4=caster:GetAbilityByName("greenterror_passive")
	local ability4origin=unit:GetAbilityByName("greenterror_passive")
	ability4origin:SetLevel(ability4origin:GetLevel())
			
	local ability5=caster:GetAbilityByName("jester_clone")
	unit:AddAbility(ability5)
	local ability5origin=unit:GetAbilityByName("jester_clone")
	ability5origin:SetLevel(ability5origin:GetLevel())
	
	local ability = keys.ability
	local level = ability:GetLevel()
	
	local dummyab = "jester_isclone"
	
	unit:AddAbility(dummyab)
	local abilite=unit:FindAbilityByName(dummyab)
	unit:SetLevel(ability5origin:GetLevel())	
	
	unit:SetHasInventory(false)
	end
end

function BackStab(keys)
	local caster=keys.caster
	local tarhet = keys.target
	local Point = caster:GetCenter()
	local ability = keys.ability
	local DMJ = (caster:GetAttackDamage())*ability:GetLevelSpecialValueFor("damagemult",ability:GetLevel())

	print(DMJ)
	
	if tarhet:IsFacing(Point,90)==false then
	local damageTable = {
	victim = tarhet,
	attacker = caster,
	Damage = DMJ,
	damage_type = DAMAGE_TYPE_PHYSICAL,
	}
	ApplyDamage(damageTable)
	end
end
