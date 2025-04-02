-----------------------------------
-- Eald2 Warp In
-- Begin Eald'Narche ZM16 (phase 2) teleport
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:useMobAbility(mob:getMobMod(invaderXim.mobMod.TELEPORT_END))
    skill:setMsg(invaderXim.msg.basic.NONE)
    return 0
end

return mobskillObject
