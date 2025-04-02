-----------------------------------
-- Citadel Buster
-- Deals extreme Light damage to players in an area of effect.
-- Additional effect: Enmity reset
-- Damage can be approximated based on Calculating Weapon Skill Damage as a magical WS with a level of 85, fTP of 6 and MAB of 4.0. Or, more simply:
-- 2088/(1+MDB%) * (256-MDT)/256 (no day/weather bonus)
-- 2608/MDB * (256-MDT)/256 (weather bonus)
-- 2816/MDB * (256-MDT)/256 (day+weather bonus)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local basedmg = 2088

    if
        mob:getWeather() == invaderXim.weather.AURORAS or
        mob:getWeather() == invaderXim.weather.STELLAR_GLARE
    then
        basedmg = basedmg + 520
    end

    if VanadielDayElement() == invaderXim.element.LIGHT then
        basedmg = basedmg + 208
    end

    local damage = basedmg / (1 + (target:getMod(invaderXim.mod.MDEF) / 100))
    local dmg = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT)
    mob:resetEnmity(target)

    return dmg
end

return mobskillObject
