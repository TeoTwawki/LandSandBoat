-----------------------------------
--  Nuclear Waste
--  Description: Reduces elemental resistances by 50 to players in range.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:setLocalVar('nuclearWaste', 1)
    local resist = invaderXim.mobskills.applyPlayerResistance(mob, invaderXim.effect.ELEMENTALRES_DOWN, target, mob:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT), 0, 0)
    if resist >= 0.25 then
        target:addStatusEffectEx(invaderXim.effect.ELEMENTALRES_DOWN, 0, 50, 0, 60)
        skill:setMsg(invaderXim.msg.basic.NONE)
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
    end

    return invaderXim.effect.ELEMENTALRES_DOWN
end

return mobskillObject
