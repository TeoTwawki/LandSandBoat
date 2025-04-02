-----------------------------------
-- Fulmination
--
-- Description: Deals heavy magical damage in an area of effect. Additional effect: Paralysis + Stun
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes Shadows
-- Range: 30 yalms
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getFamily() == 316 then
        local mobSkin = mob:getModelId()

        if mobSkin == 1805 then
            return 0
        else
            return 1
        end
    end

    local family = mob:getFamily()
    local mobHPP = mob:getHPP()

    if family == 168 and mobHPP < 35 then -- Khimaira < 35%
        return 0
    elseif family == 315 and mobHPP < 50 then -- Tyger < 50%
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.THUNDER, 3, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 40, 0, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STUN, 1, 0, 4)

    return damage
end

return mobskillObject
