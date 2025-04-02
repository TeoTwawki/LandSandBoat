-----------------------------------
-- Diamondhide
--
-- Description: Gives the effect of "Stoneskin."
-- Type: Magical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 800
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.STONESKIN, power, 0, 300))

    local effect = mob:getStatusEffect(invaderXim.effect.STONESKIN)
    if effect then
        effect:delEffectFlag(invaderXim.effectFlag.DISPELABLE)
    end

    return invaderXim.effect.STONESKIN
end

return mobskillObject
