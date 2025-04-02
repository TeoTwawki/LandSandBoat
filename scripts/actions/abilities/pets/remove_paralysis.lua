-----------------------------------
-- Remove Paralysis
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(pet, target, skill, action)
    if target:delStatusEffect(invaderXim.effect.PARALYSIS) then
        skill:setMsg(invaderXim.msg.basic.JA_REMOVE_EFFECT)
    else
        skill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT)
    end

    return invaderXim.effect.PARALYSIS
end

return abilityObject
