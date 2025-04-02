-----------------------------------
-- Gala Macabre
-- Family: Corse
-- Description: Charms all targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: N/A
-- Range: Radial
-- Notes: Only used by some notorious monsters like Xolotl and Giltine.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 0

    if not target:isPC() then
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
        return invaderXim.effect.CHARM_I
    end

    local msg = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CHARM_I, power, 3, 60)
    if msg == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        mob:charm(target)
    end

    skill:setMsg(msg)

    return invaderXim.effect.CHARM_I
end

return mobskillObject
