-----------------------------------
-- Hastega
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local bonusTime = utils.clamp(summoner:getSkillLevel(invaderXim.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    -- Garuda's Hastega is a weird exception and uses 153/1024 instead of 150/1024 like Haste spell
    -- That's why it overwrites some things regular haste won't. 153/1024 ~14.94%
    local typeEffect = invaderXim.effect.HASTE
    if target:addStatusEffect(typeEffect, 1494, 0, duration) then
        if target:getID() == action:getPrimaryTargetID() then
            petskill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT_2)
        else
            petskill:setMsg(invaderXim.msg.basic.JA_GAIN_EFFECT)
        end
    else
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
        return
    end

    return typeEffect
end

return abilityObject
