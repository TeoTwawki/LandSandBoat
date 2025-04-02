-----------------------------------
-- Heavy Armature
-- Adds buffs Haste, Shell, Protect, Blink
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getPool() == 243 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- Not much info on how much haste this gives. Supposed to be "high". Went with Magic Haste Cap
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.HASTE, 4375, 0, 180)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.PROTECT, 100, 0, 180)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLINK, math.random(10, 25), 0, 120))

    return invaderXim.effect.BLINK
end

return mobskillObject
