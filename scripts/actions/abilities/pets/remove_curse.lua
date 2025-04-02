-----------------------------------
-- Remove Curse
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(pet, target, skill, action)
    local effect
    if target:delStatusEffect(invaderXim.effect.CURSE_I) then
        skill:setMsg(invaderXim.msg.basic.JA_REMOVE_EFFECT)
        effect = invaderXim.effect.CURSE_I
    elseif target:delStatusEffect(invaderXim.effect.DOOM) then
        skill:setMsg(invaderXim.msg.basic.JA_REMOVE_EFFECT)
        effect = invaderXim.effect.DOOM
    elseif target:delStatusEffect(invaderXim.effect.BANE) then
        skill:setMsg(invaderXim.msg.basic.JA_REMOVE_EFFECT)
        effect = invaderXim.effect.BANE
    else
        skill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT)
    end

    return effect
end

return abilityObject
