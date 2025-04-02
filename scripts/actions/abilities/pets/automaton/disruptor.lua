-----------------------------------
-- Disruptor
-----------------------------------
---@type TAbilityAutomaton
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    automaton:addRecast(invaderXim.recast.ABILITY, skill:getID(), 60)
    local effect = target:dispelStatusEffect()
    if effect ~= invaderXim.effect.NONE then
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    end

    return effect
end

return abilityObject
