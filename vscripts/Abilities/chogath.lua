function AddStack(keys)
	local caster=keys.caster
	local playerowner = caster.GetPlayerOwner(caster)
	local DataCounter = GameData:For("DataCounter",playerowner)

	if DataCounter.ChoGathStacks~=6 then
		DataCounter.ChoGathStacks=DataCounter.ChoGathStacks+1
	end
	
	if DataCounter.ChoGathStacks~=0 then
	
	local ability = keys.ability
	local level = ability:GetLevel()
	
	local dummyab = "greenterror_HP" .. tostring(level)
	
	if DataCounter.ChoGathStackAbility~=dummyab then
	caster:RemoveAbility(DataCounter.ChoGathStackAbility)
	caster:RemoveModifierByName("modifier_feast_bonus")
	caster:AddAbility(dummyab)	
	DataCounter.ChoGathStackAbility=dummyab	
	end
	
	local abilite=caster:FindAbilityByName(dummyab)
	abilite:SetLevel(DataCounter.ChoGathStacks)	
	
	local scale=(100+abilite:GetLevelSpecialValueFor("stack_scale",level))/100
	caster:SetModelScale(scale)	
	end
end

function RemoveStack(keys)
	local caster=keys.caster
	local playerowner = caster.GetPlayerOwner(caster)
	local DataCounter = GameData:For("DataCounter",playerowner)
	local ability = keys.ability
	
	if DataCounter.ChoGathStacks~=0 then
	
	if DataCounter.ChoGathStacks==2 then
		DataCounter.ChoGathStacks=1
	end
	if DataCounter.ChoGathStacks==3 then
		DataCounter.ChoGathStacks=2
	end
	if DataCounter.ChoGathStacks==4 then
		DataCounter.ChoGathStacks=2
	end
	if DataCounter.ChoGathStacks==5 then
		DataCounter.ChoGathStacks=3
	end
	if DataCounter.ChoGathStacks==6 then
		DataCounter.ChoGathStacks=3
	end
	
	local ability = keys.ability
	local level = ability:GetLevel()
	
	local dummyab = "greenterror_HP" .. tostring(level)
		
	if DataCounter.ChoGathStackAbility~=dummyab then
	caster:RemoveAbility(DataCounter.ChoGathStackAbility)
	caster:RemoveModifierByName("modifier_feast_bonus")
	caster:AddAbility(dummyab)	
	DataCounter.ChoGathStackAbility=dummyab	
	end
		
	local abilite=caster:FindAbilityByName(dummyab)
	abilite:SetLevel(DataCounter.ChoGathStacks)		
	
	local scale=100+abilite:GetLevelSpecialValueFor("stack_scale",level)
	caster:SetModelScale(scale)	
	
	end
	
end

function UpdateStack(keys)
	local caster=keys.caster
	local playerowner = caster:GetPlayerOwner()
	local DataCounter = GameData:For("DataCounter",playerowner)
	local ability = keys.ability
	
	if DataCounter.ChoGathStacks~=0 then
	
	local ability = keys.ability
	local level = ability:GetLevel()
	
	local dummyab = "greenterror_HP" .. tostring(level)
		
	if DataCounter.ChoGathStackAbility~=dummyab then
	caster:RemoveAbility(DataCounter.ChoGathStackAbility)
	caster:RemoveModifierByName("modifier_feast_bonus")
	caster:AddAbility(dummyab)	
	DataCounter.ChoGathStackAbility=dummyab	
	end
		
	local abilite=caster:FindAbilityByName(dummyab)
	abilite:SetLevel(DataCounter.ChoGathStacks)		
	
	local scale=(100+abilite:GetLevelSpecialValueFor("stack_scale",level))/100
	caster:SetModelScale(scale)	
	
	end
	
end

function DamageTarget(keys)
	local caster=keys.caster
	local target = keys.target
	local ability = keys.ability
	
	local damageTable = {
	victim = target,
	attacker = caster,
	Damage = ability:GetLevelSpecialValueFor("damage",ability:GetLevel()),
	damage_type = DAMAGE_TYPE_PURE,
	damage_flags	=	DOTA_UNIT_TARGET_HERO,
	}
	ApplyDamage(damageTable)
	damageTable = {
	victim = target,
	attacker = caster,
	Damage = ability:GetLevelSpecialValueFor("creepdamage",ability:GetLevel()),
	damage_type = DAMAGE_TYPE_PURE,
	damage_flags	=	DOTA_UNIT_TARGET_BASIC,
	}
	ApplyDamage(damageTable)
end

