-----------------------------------
-- Nihility Song
-- Family: Hippogryph
-- Description: A song dispels a positive effect in an area of effect, including food.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Radial 12.5'
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dispel =  target:dispelStatusEffect(bit.bor(invaderXim.effectFlag.DISPELABLE, invaderXim.effectFlag.FOOD))

    if dispel == invaderXim.effect.NONE then
        -- no effect
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
    end

    return dispel
end

return mobskillObject
