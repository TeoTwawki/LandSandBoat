-----------------------------------
--  Ill Wind
--  Description: Deals Wind damage to enemies within an area of effect. Additional effect: Dispel
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes Shadows
--  Range: Unknown radial
--  Notes: Only used by Puks in Mamook, Besieged, and the following Notorious Monsters: Vulpangue, Nis Puk, Nguruvilu, Seps , Phantom Puk and Waugyl. Dispels one invaderXim.effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getFamily() == 316 and mob:getModelId() == 1746 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:dispelStatusEffect()
    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)

    return damage
end

return mobskillObject
