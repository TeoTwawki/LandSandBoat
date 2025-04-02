-----------------------------------
-- Economizer
-----------------------------------
---@type TAbilityAutomaton
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    automaton:addRecast(invaderXim.recast.ABILITY, skill:getID(), 180)
    local maneuvers = master:countEffect(invaderXim.effect.DARK_MANEUVER)
    local amount = math.floor(automaton:getMaxMP() * 0.2 * maneuvers)
    skill:setMsg(invaderXim.msg.basic.SKILL_RECOVERS_MP)

    for i = 1, maneuvers do
        master:delStatusEffectSilent(invaderXim.effect.DARK_MANEUVER)
    end

    return automaton:addMP(amount)
end

return abilityObject
