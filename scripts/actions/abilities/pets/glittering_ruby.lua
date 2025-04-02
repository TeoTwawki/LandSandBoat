-----------------------------------
-- Glittering Ruby
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    --randomly give str/dex/vit/agi/int/mnd/chr (+12)
    local effects =
    {
        invaderXim.effect.STR_BOOST,
        invaderXim.effect.DEX_BOOST,
        invaderXim.effect.VIT_BOOST,
        invaderXim.effect.AGI_BOOST,
        invaderXim.effect.INT_BOOST,
        invaderXim.effect.MND_BOOST,
        invaderXim.effect.CHR_BOOST,
    }

    local effectId    = utils.randomEntry(effects)
    local effectPower = math.random(12, 14)

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    target:addStatusEffect(effectId, effectPower, 0, 90)

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT_2)
    else
        petskill:setMsg(invaderXim.msg.basic.JA_GAIN_EFFECT)
    end

    return effectId
end

return abilityObject
