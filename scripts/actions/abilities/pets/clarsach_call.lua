-----------------------------------
-- Clarsach Call
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

-- https://www.bg-wiki.com/ffxi/Clarsach_Call
abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = math.floor(48 + pet:getMainLvl() * 8 + (pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)) * 1.5)

    damage = invaderXim.mobskills.mobMagicalMove(pet, target, petskill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = invaderXim.mobskills.mobAddBonuses(pet, target, damage, invaderXim.element.WIND, petskill)
    damage = invaderXim.summon.avatarFinalAdjustments(damage, pet, petskill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, 1)

    summoner:setMP(0)
    target:takeDamage(damage, pet, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)
    target:updateEnmityFromDamage(pet, damage)

    pet:addStatusEffect(invaderXim.effect.ATTACK_BOOST,        25, 0, 180)
    pet:addStatusEffect(invaderXim.effect.DEFENSE_BOOST,       25, 0, 180)
    pet:addStatusEffect(invaderXim.effect.MAGIC_ATK_BOOST,     25, 0, 180)
    pet:addStatusEffect(invaderXim.effect.MAGIC_DEF_BOOST,     25, 0, 180)
    pet:addStatusEffect(invaderXim.effect.EVASION_BOOST,       50, 0, 180)
    pet:addStatusEffect(invaderXim.effect.MAGIC_EVASION_BOOST, 50, 0, 180)

    return damage
end

return abilityObject
