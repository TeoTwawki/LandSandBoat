-----------------------------------
-- Rolling Thunder
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local bonusTime = utils.clamp(summoner:getSkillLevel(invaderXim.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration  = 120 + bonusTime

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local magicskill = invaderXim.combat.skillLevel.getSkillCap(target:getMainLvl(), invaderXim.skillRank.A_PLUS)
    local potency    = 3 + 6 * magicskill / 100

    if magicskill > 200 then
        potency = 5 + 5 * magicskill / 100
    end

    invaderXim.mobskills.mobBuffMove(target, invaderXim.effect.ENTHUNDER, potency, 0, duration)

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(invaderXim.msg.basic.JA_RECEIVES_EFFECT_2)
    else
        petskill:setMsg(invaderXim.msg.basic.JA_RECEIVES_EFFECT)
    end

    return invaderXim.effect.ENTHUNDER
end

return abilityObject
