-----------------------------------
--  Hexidiscs
--
--  Description: A sixfold attack damages targets in a fan-shaped area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 6 shadows
--  Range: Unknown cone
--  Notes: Only used in "ball" form.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

-----------------------------------
-- onMobSkillCheck
-- if not in Ball form, then ignore.
-----------------------------------
mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() ~= 0 then
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 6
    local accmod = 1
    local ftp    = .7
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
