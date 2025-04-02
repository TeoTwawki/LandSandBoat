-----------------------------------
-- Replicator
-----------------------------------
---@type TAbilityAutomaton
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    automaton:addRecast(invaderXim.recast.ABILITY, skill:getID(), 60)
    local maneuvers = master:countEffect(invaderXim.effect.WIND_MANEUVER)
    local duration = 300
    local shadows = 1 + maneuvers -- math.floor(maneuvers * 3.5) currently on retail

    if target:addStatusEffect(invaderXim.effect.BLINK, shadows, 0, duration) then
        skill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT)
        for i = 1, maneuvers do
            master:delStatusEffectSilent(invaderXim.effect.WIND_MANEUVER)
        end
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    end

    return invaderXim.effect.BLINK
end

return abilityObject
