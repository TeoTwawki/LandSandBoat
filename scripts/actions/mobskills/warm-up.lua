-----------------------------------
-- Warm-Up
-- Description: Enhances accuracy and evasion.
-- Type: Magical (Earth)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 40
    local effectID

    if mob:hasStatusEffect(invaderXim.effect.ACCURACY_BOOST) then
        skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ACCURACY_BOOST, power, 0, 60))
        effectID = invaderXim.effect.ACCURACY_BOOST
    end

    if mob:hasStatusEffect(invaderXim.effect.EVASION_BOOST) then
        skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.EVASION_BOOST, power, 0, 60))
        effectID = invaderXim.effect.EVASION_BOOST
    end

    return effectID
end

return mobskillObject
