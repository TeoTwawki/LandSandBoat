-----------------------------------
--  Luminous Lance
-----------------------------------
local ID = zones[invaderXim.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local lanceTime = mob:getLocalVar('lanceTime')
    local lanceOut = mob:getLocalVar('lanceOut')

    if
        not (target:hasStatusEffect(invaderXim.effect.PHYSICAL_SHIELD) and target:hasStatusEffect(invaderXim.effect.MAGIC_SHIELD)) and
        lanceTime + 60 < mob:getBattleTime() and
        target:getCurrentAction() ~= invaderXim.act.MOBABILITY_USING and
        lanceOut == 1
    then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:showText(mob, ID.text.SELHTEUS_TEXT + 1)

    local numhits = 1
    local accmod = 1
    local dmgmod = 1.6

    local info = invaderXim.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, dmgmod, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, info.hitslanded)

    mob:entityAnimationPacket('ids0')
    mob:setLocalVar('lanceTime', mob:getBattleTime())
    mob:setLocalVar('lanceOut', 0)
    target:setAnimationSub(3)

    -- Cannot be resisted
    target:addStatusEffect(invaderXim.effect.TERROR, 0, 0, 20)

    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING)
    return dmg
end

return mobskillObject
