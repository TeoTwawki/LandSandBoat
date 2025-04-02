-----------------------------------
-- Wheel of Impregnability
-----------------------------------
local ID = zones[invaderXim.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        mob:hasStatusEffect(invaderXim.effect.PHYSICAL_SHIELD) or
        mob:hasStatusEffect(invaderXim.effect.MAGIC_SHIELD)
    then
        return 1
    end

    mob:showText(mob, ID.text.PROMATHIA_TEXT + 5)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:addStatusEffect(invaderXim.effect.PHYSICAL_SHIELD, 1, 0, 0)
    mob:setAnimationSub(1)

    skill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT)
    return invaderXim.effect.PHYSICAL_SHIELD
end

return mobskillObject
