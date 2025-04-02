-----------------------------------
-- Crescent Fang
-- Fenrir inflicts Paralysis along with a single attack to target.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 2
    local ftp    = 5

    local damage = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, 0, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 1, 2, 3)
    local totaldamage = invaderXim.mobskills.mobFinalAdjustments(damage.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, numhits)

    if damage.hitslanded > 0 then
        target:addStatusEffect(invaderXim.effect.PARALYSIS, 50, 0, 90)
    end

    target:takeDamage(totaldamage, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    return totaldamage
end

return mobskillObject
