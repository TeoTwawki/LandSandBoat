-----------------------------------
-- Nerve Gas
--
-- Description: Inflicts curse and powerful poison invaderXim.effect.
-- Type: Magical
-- Wipes Shadows
-- Range: 10' Radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getFamily() == 316 then -- PW
        local mobSkin = mob:getModelId()
        if mobSkin == 1796 then
            return 0
        else
            return 1
        end
    elseif mob:getFamily() == 313 then -- Tinnin can use at will
        return 0
    else
        if mob:getAnimationSub() == 0 then
            return 0
        else
            return 1
        end
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CURSE_I, 50, 0, 420))
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 20, 3, 60)
    return invaderXim.effect.CURSE_I
end

return mobskillObject
