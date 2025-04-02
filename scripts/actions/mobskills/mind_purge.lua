-----------------------------------
-- Mind Purge
-- Description: Dispels all buffs from a single target, including food.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Dispels shadows
-- Range: Single target
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dispel =  target:dispelAllStatusEffect(bit.bor(invaderXim.effectFlag.DISPELABLE, invaderXim.effectFlag.FOOD))
    local msg -- to be set later

    if dispel == 0 then
        msg = invaderXim.msg.basic.SKILL_NO_EFFECT -- no effect
    else
        msg = invaderXim.msg.basic.DISAPPEAR_NUM
    end

    skill:setMsg(msg)

    return dispel
end

return mobskillObject
