-----------------------------------
-- Nightmare - Player's Avatar
-- AoE Sleep
-- Sleep that is not broken from DoT effects (any dmg source that doesn't break bind).
-- This version of it is from a player's avatar. The sleep is broken by most damage sources except other DoTs
--
-- see mobskills/nightmare.lua for full explanation
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)
    local duration = 90
    local dotdamage = 2
    local sleepTier = 1
    local dINT = pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
    local bonus = invaderXim.summon.getSummoningSkillOverCap(pet)
    local resm = invaderXim.mobskills.applyPlayerResistance(pet, -1, target, dINT, bonus, invaderXim.element.DARK)
    if resm < 0.5 then
        petskill:setMsg(invaderXim.msg.basic.JA_MISS_2) -- resist message
        return invaderXim.effect.SLEEP_I
    end

    duration = duration * resm
    if
        target:hasImmunity(invaderXim.immunity.DARK_SLEEP) or
        target:hasStatusEffect(invaderXim.effect.SLEEP_I) or
        target:hasStatusEffect(invaderXim.effect.SLEEP_II) or
        target:hasStatusEffect(invaderXim.effect.LULLABY)
    then
        --No effect
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
    elseif target:addStatusEffect(invaderXim.effect.SLEEP_I, 1, 0, duration, 0, dotdamage, sleepTier) then
        petskill:setMsg(invaderXim.msg.basic.JA_GAIN_EFFECT)
    else
        petskill:setMsg(invaderXim.msg.basic.JA_MISS_2)
    end

    return invaderXim.effect.SLEEP_I
end

return abilityObject
