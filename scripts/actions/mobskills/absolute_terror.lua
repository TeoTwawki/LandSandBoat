-----------------------------------
-- Absolute Terror
-- Causes Terror, which causes the victim to be stunned for the duration of the effect, this can not be removed.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        mob:hasStatusEffect(invaderXim.effect.MIGHTY_STRIKES) or
        mob:hasStatusEffect(invaderXim.effect.SUPER_BUFF) or
        mob:hasStatusEffect(invaderXim.effect.INVINCIBLE) or
        mob:hasStatusEffect(invaderXim.effect.BLOOD_WEAPON) or
        not target:isInfront(mob, 128) or
        mob:getAnimationSub() == 1
    then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power    = 30
    local duration = math.random(15, 45)

    if skill:isAoE() then
        duration = math.random(10, 18)
    end

    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.TERROR, power, 0, duration))

    return invaderXim.effect.TERROR
end

return mobskillObject
