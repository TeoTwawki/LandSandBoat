-----------------------------------
--  Winds of Oblivion
-----------------------------------
local ID = zones[invaderXim.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    mob:showText(mob, ID.text.PROMATHIA_TEXT + 6)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- Subpower 100 prevents removal by Ecphoria Ring
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.AMNESIA, 30, 0, 75, 100))
    return invaderXim.effect.AMNESIA
end

return mobskillObject
