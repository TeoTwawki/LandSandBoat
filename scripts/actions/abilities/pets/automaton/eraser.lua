-----------------------------------
-- Eraser
-----------------------------------
---@type TAbilityAutomaton
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

local removableStatus =
{
    invaderXim.effect.PETRIFICATION,
    invaderXim.effect.SILENCE,
    invaderXim.effect.BANE,
    invaderXim.effect.CURSE_II,
    invaderXim.effect.CURSE_I,
    invaderXim.effect.PARALYSIS,
    invaderXim.effect.PLAGUE,
    invaderXim.effect.POISON,
    invaderXim.effect.DISEASE,
    invaderXim.effect.BLINDNESS,
}

local function removeStatus(target)
    for _, effectId in ipairs(removableStatus) do
        if target:delStatusEffect(effectId) then
            return true
        end
    end

    if target:eraseStatusEffect() ~= invaderXim.effect.NONE then
        return true
    end

    return false
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    automaton:addRecast(invaderXim.recast.ABILITY, skill:getID(), 30)
    local maneuvers = master:countEffect(invaderXim.effect.LIGHT_MANEUVER)
    skill:setMsg(invaderXim.msg.basic.USES)

    local toremove = maneuvers
    local removed = 0

    repeat
        if not removeStatus(target) then
            break
        end

        toremove = toremove - 1
        removed = removed + 1
    until toremove <= 0

    for i = 1, maneuvers do
        master:delStatusEffectSilent(invaderXim.effect.LIGHT_MANEUVER)
    end

    return removed
end

return abilityObject
