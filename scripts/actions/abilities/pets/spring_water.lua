-----------------------------------
-- Spring Water
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local base = 47 + pet:getMainLvl() * 3
    local tp   = pet:getTP()

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    if tp < 1000 then
        tp = 1000
    end

    base = base * tp / 1000

    if target:getHP() + base > target:getMaxHP() then
        base = target:getMaxHP() - target:getHP() --cap it
    end

    target:delStatusEffect(invaderXim.effect.BLINDNESS)
    target:delStatusEffect(invaderXim.effect.POISON)
    target:delStatusEffect(invaderXim.effect.PARALYSIS)
    target:delStatusEffect(invaderXim.effect.DISEASE)
    target:delStatusEffect(invaderXim.effect.PETRIFICATION)
    target:wakeUp()
    target:delStatusEffect(invaderXim.effect.SILENCE)

    if math.random(1, 100) <= 50 then
        target:delStatusEffect(invaderXim.effect.SLOW)
    end

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(invaderXim.msg.basic.JA_RECOVERS_HP_2)
    else
        petskill:setMsg(invaderXim.msg.basic.SELF_HEAL_SECONDARY)
    end

    target:addHP(base)
    return base
end

return abilityObject
