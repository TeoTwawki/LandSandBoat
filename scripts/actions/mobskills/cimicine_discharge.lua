-----------------------------------
-- Cimicine Discharge
-- Reduces the attack speed of enemies within range.
-- Duration: Variable, with max of 3 min
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 1950
    local duration = math.random(60, 180)

    if not mob:hasStatusEffect(invaderXim.effect.HASTE) then
        mob:addStatusEffect(invaderXim.effect.HASTE, 1500, 0, duration)
    end

    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, power, 0, duration))

    return invaderXim.effect.SLOW

    --[[ Is there suppsoed to be a message about haste?
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.HASTE, 150, 0, duration))
    return invaderXim.effect.HASTE
    ]]--
end

return mobskillObject
