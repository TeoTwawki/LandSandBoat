-----------------------------------
-- Boiling Blood
-- Description: Boiling Blood
-- Foe gains Haste +25% and Berserk +50%
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.HASTE, 2500, 0, 180)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BERSERK, 50, 0, 180)
    skill:setMsg(invaderXim.msg.basic.NONE)
    return 0
end

return mobskillObject
