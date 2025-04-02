-----------------------------------
-- Magma_Hoplon
-- Covers the user in fiery spikes and absorbs damage. Enemies that hit it take fire damage.
-- Stoneskin portion cannot be removed with dispel.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.STONESKIN, 1000, 0, 300))
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLAZE_SPIKES, math.random(20, 30), 0, 180)

    local effect = mob:getStatusEffect(invaderXim.effect.STONESKIN)
    if effect then
        effect:delEffectFlag(invaderXim.effectFlag.DISPELABLE)
    end

    return invaderXim.effect.STONESKIN
end

return mobskillObject
