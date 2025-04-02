-----------------------------------
-- Prishe Item 2
-----------------------------------
local ID = zones[invaderXim.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        target:hasStatusEffect(invaderXim.effect.PHYSICAL_SHIELD) or
        target:hasStatusEffect(invaderXim.effect.MAGIC_SHIELD)
    then
        return 1
    elseif
        mob:hasStatusEffect(invaderXim.effect.PLAGUE) or
        mob:hasStatusEffect(invaderXim.effect.CURSE_I) or
        mob:hasStatusEffect(invaderXim.effect.MUTE)
    then
        return 0
    elseif math.random(1, 100) <= 25 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.msg.basic.NONE)
    if
        mob:hasStatusEffect(invaderXim.effect.PLAGUE) or
        mob:hasStatusEffect(invaderXim.effect.CURSE_I) or
        mob:hasStatusEffect(invaderXim.effect.MUTE)
    then
        -- use Remedy!
        mob:messageText(mob, ID.text.PRISHE_TEXT + 12, false)
        mob:delStatusEffect(invaderXim.effect.PLAGUE)
        mob:delStatusEffect(invaderXim.effect.CURSE_I)
        mob:delStatusEffect(invaderXim.effect.MUTE)
    elseif math.random(1, 100) <= 50 then
        -- Carnal Incense!
        mob:messageText(mob, ID.text.PRISHE_TEXT + 10, false)
        mob:addStatusEffect(invaderXim.effect.PHYSICAL_SHIELD, 1, 0, 30)
    else
        -- Spiritual Incense!
        mob:messageText(mob, ID.text.PRISHE_TEXT + 11, false)
        mob:addStatusEffect(invaderXim.effect.MAGIC_SHIELD, 1, 0, 30)
    end

    return 0
end

return mobskillObject
