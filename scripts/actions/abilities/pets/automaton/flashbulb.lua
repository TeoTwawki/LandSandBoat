-----------------------------------
-- Flashbulb
-----------------------------------
---@type TAbilityAutomaton
local abilityObject = {}

abilityObject.onAutomatonAbilityCheck = function(target, automaton, skill)
    return 0
end

abilityObject.onAutomatonAbility = function(target, automaton, skill, master, action)
    automaton:addRecast(invaderXim.recast.ABILITY, skill:getID(), 45)
    local highest = automaton:getSkillLevel(invaderXim.skill.AUTOMATON_MELEE)
    local highestskill = 22
    if automaton:getSkillLevel(invaderXim.skill.AUTOMATON_RANGED) > highest then
        highestskill = 23
        highest = automaton:getSkillLevel(invaderXim.skill.AUTOMATON_RANGED)
    end

    if automaton:getSkillLevel(invaderXim.skill.AUTOMATON_MAGIC) > highest then
        highestskill = 24
    end

    local resist = applyResistanceAbility(automaton, target, 7, highestskill, 150)
    local duration = 12 * resist

    if resist > 0.0625 then
        if target:addStatusEffect(invaderXim.effect.FLASH, 200, 0, duration) then
            skill:setMsg(invaderXim.msg.basic.SKILL_ENFEEB)
        else
            skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
        end
    else
        skill:setMsg(invaderXim.msg.basic.JA_MISS_2)
    end

    return invaderXim.effect.FLASH
end

return abilityObject
