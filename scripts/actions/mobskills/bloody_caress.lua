-----------------------------------
--  Bloody Caress
--
--  Delivers a threefold attack. Additional effect: Drain
--  Type: Physical
--  100% TP: ??? / 250% TP: ??? / 300% TP: ???
--  Note: There is not a whole lot of info about this spell available online,
--        so the initial implemention is just a basic version similar to
--        Goblin Rush, which is also a physical 3-hit spell.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod = 1
    local ftp    = 1

    -- TODO: Once `Floral Bouquet` TP move is implemented, this skill is eligible to target
    -- the charmed monsters.

    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.ACC_VARIES, 1, 2, 3)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)
    skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, dmg))

    return dmg
end

return mobskillObject
