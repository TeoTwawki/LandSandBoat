-----------------------------------
-- Goblin Dice
-- Description: Stun
-- Type: Physical (Blunt)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local slowed  = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 120)
    local sleeped = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, 30)

    skill:setMsg(invaderXim.msg.basic.SKILL_ENFEEB_IS)
    if sleeped then
        return invaderXim.effect.SLEEP_I
    elseif slowed then
        return invaderXim.effect.SLOW
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS) -- no effect
    end

    return nil
end

return mobskillObject
