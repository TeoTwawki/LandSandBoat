-----------------------------------
-- Frog Chorus
-- Description: Charms all targets in an area of effect and transforms them into frogs.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if not target:isPC() then
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
        return invaderXim.effect.CHARM_I
    end

    local msg = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CHARM_I, 0, 3, 60)
    if msg == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        mob:charm(target)
        target:addStatusEffect(invaderXim.effect.COSTUME, 1812, 0, 60)
    end

    skill:setMsg(msg)

    return invaderXim.effect.CHARM_I
end

return mobskillObject
