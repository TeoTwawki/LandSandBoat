-----------------------------------
-- Burning Strike
-- Hybrid
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local baseDamage = invaderXim.summon.avatarPhysicalMove(pet, target, petskill, 1, 1, 6, 0, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1, 2, 3)
    local damage     = math.floor(baseDamage.dmg + pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT))

    -- Add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    damage = invaderXim.mobskills.mobMagicalMove(pet, target, petskill, damage, invaderXim.element.FIRE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = invaderXim.mobskills.mobAddBonuses(pet, target, damage, invaderXim.element.FIRE, petskill)
    damage = invaderXim.summon.avatarFinalAdjustments(damage, pet, petskill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, 1)

    target:takeDamage(damage, pet, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end

return abilityObject
