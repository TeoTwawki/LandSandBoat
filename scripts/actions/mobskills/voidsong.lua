-----------------------------------
--  Voidsong
--  Description: Removes all status effects in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 20' radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- can only used if not silenced
    if
        mob:getMainJob() == invaderXim.job.BRD and
        not mob:hasStatusEffect(invaderXim.effect.SILENCE)
    then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:eraseAllStatusEffect()
    local count = target:dispelAllStatusEffect()
    count = count + target:eraseAllStatusEffect()

    if count == 0 then
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(invaderXim.msg.basic.DISAPPEAR_NUM)
    end

    return count
end

return mobskillObject
