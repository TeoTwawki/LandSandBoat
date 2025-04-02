-----------------------------------
-- Shining Ruby
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

    target:delStatusEffect(invaderXim.effect.SHINING_RUBY)
    target:addStatusEffect(invaderXim.effect.SHINING_RUBY, 1, 0, duration)

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT_2)
    else
        petskill:setMsg(invaderXim.msg.basic.JA_GAIN_EFFECT)
    end

    return invaderXim.effect.SHINING_RUBY
end

return abilityObject
