-----------------------------------
-- Perdition
-- Description: Instant K.O.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if
        target:isUndead() or
        target:hasStatusEffect(invaderXim.effect.MAGIC_SHIELD) or
        -- Todo: DeathRes has no place in the resistance functions so far..
        math.random(1, 100) <= target:getMod(invaderXim.mod.DEATH_MEVA)
    then
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
        return 0
    end

    skill:setMsg(invaderXim.msg.basic.FALL_TO_GROUND)
    target:setHP(0)

    return 0
end

return mobskillObject
