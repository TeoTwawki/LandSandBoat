-----------------------------------
-- Reactive Shield
-----------------------------------
---@type TAbilityAutomaton
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    automaton:addRecast(invaderXim.recast.ABILITY, skill:getID(), 65)
    local pMod = automaton:getSkillLevel(invaderXim.skill.AUTOMATON_MAGIC)
    local duration = 60
    local power = math.floor((pMod / 56)^3 / 8) + 4 -- No idea how the actual formula used Automaton skill level, so heres a placeholder (4 @ lvl 1, 10 @ lvl 61, 20 @ lvl 75, 62 @ lvl 99)

    if target:addStatusEffect(invaderXim.effect.BLAZE_SPIKES, power, 0, duration) then
        skill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT)
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    end

    return invaderXim.effect.BLAZE_SPIKES
end

return abilityObject
