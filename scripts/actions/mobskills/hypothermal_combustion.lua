-----------------------------------
-- Hypothermal Combustion
-- Self-destructs, releasing ice at nearby targets.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Notes: Damage is based on remaining HP
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:isMobType(invaderXim.mobType.NOTORIOUS) then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * skill:getMobHPP() / 5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.ICE, 1, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE)
    mob:setHP(0)

    return damage
end

return mobskillObject
