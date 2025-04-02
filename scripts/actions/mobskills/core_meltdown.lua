-----------------------------------
-- Core Meltdown (Ghrah)
-- Reactor core fails and self-destructs, damaging any nearby targets.
-- Note: Very rare, estimated 5% chance
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:isMobType(invaderXim.mobType.NOTORIOUS) then
        return 1
    elseif mob:getAnimationSub() ~= 0 then -- form check
        return 1
    elseif math.random(1, 100) >= 5 then -- here's the 95% chance to not blow up
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * math.random(7, 15)

    -- TODO: The damage type should be based off of the Ghrah's element
    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.NONE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.ELEMENTAL, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.ELEMENTAL)
    mob:setHP(0)

    return damage
end

return mobskillObject
