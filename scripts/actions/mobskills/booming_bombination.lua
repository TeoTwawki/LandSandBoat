-----------------------------------
--  Booming Bombination
--  Description: Deals damage. Additional effect: "Plague", "Def. Down", "M. Def. Down".
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Aoe
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 10
    local duration = math.random(60, 180)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PLAGUE, power, 0, duration)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEFENSE_DOWN, power, 0, duration)

    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.MAGIC_DEF_DOWN, power, 0, duration))

    return invaderXim.effect.MAGIC_DEF_DOWN
end

return mobskillObject
