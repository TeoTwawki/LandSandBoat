-----------------------------------
-- Searing Light
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = math.floor(26 + pet:getMainLvl() * 6 + (pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)) * 1.5)

    damage = invaderXim.mobskills.mobMagicalMove(pet, target, petskill, damage, invaderXim.element.LIGHT, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = invaderXim.mobskills.mobAddBonuses(pet, target, damage, invaderXim.element.LIGHT, petskill)
    damage = invaderXim.summon.avatarFinalAdjustments(damage, pet, petskill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT, 1)

    target:takeDamage(damage, pet, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT)
    target:updateEnmityFromDamage(pet, damage)
    summoner:setMP(0)

    return damage
end

return abilityObject
