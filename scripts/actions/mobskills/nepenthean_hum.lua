-----------------------------------
-- Nepenthean Hum
-- Description: Inflicts amnesia 10' AOE
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if VanadielHour() >= 6 and VanadielHour() <= 18 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- Subpower 100 prevents removal by Ecphoria Ring
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.AMNESIA, 1, 0, 60, 100))
    return invaderXim.effect.AMNESIA
end

return mobskillObject
