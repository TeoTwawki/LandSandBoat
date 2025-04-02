-----------------------------------
-- Salaheem Spirit
-- Description: Provides a bonus to base attributes for party members in area of effect. Duration varies by TP
-- Only available to Abquhbah Trust
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = math.floor(mob:getMainLvl() / 4)
    local tick = 10
    local duration = 50
    local bonusTime = math.floor(mob:getTP() / 10) + 5

    target:delStatusEffect(invaderXim.effect.STR_BOOST)
    target:delStatusEffect(invaderXim.effect.DEX_BOOST)
    target:delStatusEffect(invaderXim.effect.VIT_BOOST)
    target:delStatusEffect(invaderXim.effect.AGI_BOOST)
    target:delStatusEffect(invaderXim.effect.INT_BOOST)
    target:delStatusEffect(invaderXim.effect.MND_BOOST)
    target:delStatusEffect(invaderXim.effect.CHR_BOOST)

    target:addStatusEffect(invaderXim.effect.STR_BOOST, power, tick, duration + bonusTime)
    target:addStatusEffect(invaderXim.effect.DEX_BOOST, power, tick, duration + bonusTime)
    target:addStatusEffect(invaderXim.effect.VIT_BOOST, power, tick, duration + bonusTime)
    target:addStatusEffect(invaderXim.effect.AGI_BOOST, power, tick, duration + bonusTime)
    target:addStatusEffect(invaderXim.effect.INT_BOOST, power, tick, duration + bonusTime)
    target:addStatusEffect(invaderXim.effect.MND_BOOST, power, tick, duration + bonusTime)
    target:addStatusEffect(invaderXim.effect.CHR_BOOST, power, tick, duration + bonusTime)

    skill:setMsg(invaderXim.msg.basic.STATUS_BOOST_2)

    return 0
end

return mobskillObject
