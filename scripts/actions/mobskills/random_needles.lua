-----------------------------------
-- ??? Needles
-- Description: Shoots multiple needles at enemies within range.
-- 'The Amigo Sabotender's special ability 1000 Needles has been renamed ??? Needles.''
-- https://forum.square-enix.com/ffxi/threads/46068-Feb-19-2015-(JST)-Version-Update
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
        -- from http://ffxiclopedia.wikia.com/wiki/%3F%3F%3F_Needles
        -- "Seen totals ranging from 15, 000 to 55, 000 needles."
    if mob:getID() == zones[invaderXim.zone.ABYSSEA_ALTEPA].mob.CUIJATENDER then
        local needles = math.random(15000, 55000) / skill:getTotalTargets()
        local dmg     = invaderXim.mobskills.mobFinalAdjustments(needles, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

        target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.LIGHT)

        return dmg
    else
        local needles = math.random(1000, 10000) / skill:getTotalTargets()
        local dmg     = invaderXim.mobskills.mobFinalAdjustments(needles, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

        target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.LIGHT)

        return dmg
    end
end

return mobskillObject
