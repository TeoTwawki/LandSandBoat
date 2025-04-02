-----------------------------------
-- Shock Absorber
-----------------------------------
---@type TAbilityAutomaton
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    automaton:addRecast(invaderXim.recast.ABILITY, skill:getID(), 180)
    local maneuvers = master:countEffect(invaderXim.effect.EARTH_MANEUVER)
    local pMod = math.max(automaton:getSkillLevel(invaderXim.skill.AUTOMATON_MELEE), automaton:getSkillLevel(invaderXim.skill.AUTOMATON_RANGED), automaton:getSkillLevel(invaderXim.skill.AUTOMATON_MAGIC))
    local duration = 180
    local amount = 200
    local bonus = 0

    if automaton:getLocalVar('shockabsorber') >= 4 then -- Shock Absorber III
        if maneuvers == 1 then
            bonus = pMod * 0.6
        elseif maneuvers == 2 then
            bonus = pMod * 1.0
        elseif maneuvers == 3 then
            bonus = pMod * 1.4
        end
    elseif automaton:getLocalVar('shockabsorber') >= 2 then -- Shock Absorber II
        if maneuvers == 1 then
            bonus = pMod * 0.4
        elseif maneuvers == 2 then
            bonus = pMod * 0.75
        elseif maneuvers == 3 then
            bonus = pMod * 1.0
        end
    else -- Shock Absorber
        if maneuvers == 1 then
            bonus = pMod * 0.2
        elseif maneuvers == 2 then
            bonus = pMod * 0.4
        elseif maneuvers == 3 then
            bonus = pMod * 0.75
        end
    end

    amount = amount + math.floor(bonus)

    if target:addStatusEffect(invaderXim.effect.STONESKIN, amount, 0, duration, 0, 0, 4) then
        skill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT)
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    end

    return invaderXim.effect.STONESKIN
end

return abilityObject
