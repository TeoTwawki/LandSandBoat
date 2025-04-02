-----------------------------------
-- Remove Disease
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(pet, target, skill, action)
    local effect
    if target:delStatusEffect(invaderXim.effect.DISEASE) then
        skill:setMsg(invaderXim.msg.basic.JA_REMOVE_EFFECT)
        effect = invaderXim.effect.DISEASE
    elseif target:delStatusEffect(invaderXim.effect.PLAGUE) then
        skill:setMsg(invaderXim.msg.basic.JA_REMOVE_EFFECT)
        effect = invaderXim.effect.PLAGUE
    else
        skill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT)
    end

    return effect
end

return abilityObject
