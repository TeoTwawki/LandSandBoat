-----------------------------------
-- Skewer
-- Delivers a three-hit attack
-- Type: Physical
-- Range: Melee
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
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, 3, 1, 1, 1)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, info.hitslanded)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    if dmg > 0 then
        local resist = applyResistanceAddEffect(mob, target, invaderXim.element.ICE, 0)
        if not target:hasStatusEffect(invaderXim.effect.BIND) and resist >= 0.5 then
            local duration = (5 + 5) * resist
            target:addStatusEffect(invaderXim.effect.BIND, 1, 0, duration)
        end
    end

    return dmg
end

return mobskillObject
