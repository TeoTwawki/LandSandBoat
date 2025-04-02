-----------------------------------
-- Thunderspark
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = math.floor(275 + pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT))

    -- Add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    damage = invaderXim.mobskills.mobMagicalMove(pet, target, petskill, damage, invaderXim.element.THUNDER, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = invaderXim.mobskills.mobAddBonuses(pet, target, damage, invaderXim.element.THUNDER, petskill)
    damage = invaderXim.summon.avatarFinalAdjustments(damage, pet, petskill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, 1)

    target:takeDamage(damage, pet, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)
    target:updateEnmityFromDamage(pet, damage)

    target:addStatusEffect(invaderXim.effect.PARALYSIS, 15, 0, 60)

    return damage
end

return abilityObject
