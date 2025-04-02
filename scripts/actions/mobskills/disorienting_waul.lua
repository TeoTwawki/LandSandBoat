-----------------------------------
-- Disorienting Waul
-- Description: Inflicts Amnesia on targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: ??' radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- SubPower is resistance chance vs removal by Ecphoria Ring
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.AMNESIA, 35, 0, 60, 80))

    return invaderXim.effect.AMNESIA
end

return mobskillObject
