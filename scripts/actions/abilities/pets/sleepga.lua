-----------------------------------
-- Sleepga
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local duration = 90
    local dINT = pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
    local bonus = invaderXim.summon.getSummoningSkillOverCap(pet)
    local resm = invaderXim.mobskills.applyPlayerResistance(pet, -1, target, dINT, bonus, invaderXim.element.ICE)

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
        if target:getID() == action:getPrimaryTargetID() then
            petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
        else
            petskill:setMsg(invaderXim.msg.basic.NO_EFFECT)
        end
    else
        target:addStatusEffect(invaderXim.effect.SLEEP_I, 1, 0, duration)
        if target:getID() == action:getPrimaryTargetID() then
            petskill:setMsg(invaderXim.msg.basic.JA_RECEIVES_EFFECT_2)
        else
            petskill:setMsg(invaderXim.msg.basic.JA_RECEIVES_EFFECT)
        end
    end

    target:updateEnmity(pet)

    return invaderXim.effect.SLEEP_I
end

return abilityObject
