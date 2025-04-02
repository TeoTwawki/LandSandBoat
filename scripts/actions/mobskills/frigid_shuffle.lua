-----------------------------------
-- Frigid Shuffle
-- Description: An icy waltz paralyzes targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return invaderXim.apkallu.canUseAbility(mob, 30)
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if not target:isFacing(mob) then
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
        return
    end

    local duration = math.random(60, 120)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 50, 0, duration))

    return invaderXim.effect.PARALYSIS
end

return mobskillObject
