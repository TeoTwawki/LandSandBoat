-----------------------------------
--  Wind Shear
--
--  Description: Deals damage to enemies within an area of effect. Additional effect: Knockback
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 10' radial
--  Notes: The knockback is rather severe. Vulpangue uses an enhanced version that inflicts Weight.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getFamily() == 91 then
        local mobSkin = mob:getModelId()

        if mobSkin == 1746 then
            return 0
        else
            return 1
        end
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod = 1
    local ftp    = .8
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
