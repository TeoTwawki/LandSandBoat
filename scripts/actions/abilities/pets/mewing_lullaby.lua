-----------------------------------
-- Mewing Lullaby
-- aoe light based sleep and lowers mob TP to zero
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)
    local duration = 90
    local dINT = pet:getStat(invaderXim.mod.CHR) - target:getStat(invaderXim.mod.CHR)
    local bonus = invaderXim.summon.getSummoningSkillOverCap(pet)
    local resm = invaderXim.mobskills.applyPlayerResistance(pet, -1, target, dINT, bonus, invaderXim.element.LIGHT)
    target:setTP(0) -- "The TP lowering seems to be a total reset of TP on the mob, and even if the sleep misses, the TP reset cannot miss."
    if resm < 0.5 then
        petskill:setMsg(invaderXim.msg.basic.JA_MISS_2) -- resist message
        return invaderXim.effect.SLEEP_I
    end

    duration = duration * resm
    if
        target:hasImmunity(invaderXim.immunity.LIGHT_SLEEP) or
        target:hasStatusEffect(invaderXim.effect.SLEEP_I) or
        target:hasStatusEffect(invaderXim.effect.SLEEP_II) or
        target:hasStatusEffect(invaderXim.effect.LULLABY)
    then
        --No effect
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
    else
        petskill:setMsg(invaderXim.msg.basic.JA_GAIN_EFFECT)

        target:addStatusEffect(invaderXim.effect.SLEEP_I, 1, 0, duration)
    end

    return invaderXim.effect.LULLABY
end

return abilityObject
