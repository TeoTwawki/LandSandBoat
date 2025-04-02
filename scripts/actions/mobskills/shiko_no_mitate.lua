-----------------------------------
-- Shiko no Mitate
-- Enhances defense.
-- Trust: Gessho: Shiko no Mitate : Defense Boost + Stoneskin + Issekigan
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.DEFENSE_BOOST, 15, 0, 300))

    -- Extra stuff for Trust: Gessho
    if mob:getObjType() == invaderXim.objType.TRUST then
        mob:addStatusEffect(invaderXim.effect.ISSEKIGAN, 25, 0, 300)
        mob:addStatusEffect(invaderXim.effect.STONESKIN, 300, 0, 300)
    end

    return invaderXim.effect.DEFENSE_BOOST
end

return mobskillObject
