-----------------------------------
--  Pyric Blast
--
--  Description: Deals Fire damage to enemies within a fan-shaped area. Additional effect: Plague
--  Type: Breath
--  Ignores Shadows
--  Range: Unknown Cone
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getFamily() == 316 then
        local mobSkin = mob:getModelId()

        if mobSkin == 1796 then
            return 0
        else
            return 1
        end
    end

    if mob:getAnimationSub() == 0 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.01, 0.1, invaderXim.element.FIRE, 700)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PLAGUE, 5, 3, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.FIRE)

    if
        mob:getFamily() == 313 and
        bit.band(mob:getBehavior(), invaderXim.behavior.NO_TURN) == 0
    then
        -- re-enable no turn if all three heads are up
        mob:setBehavior(bit.bor(mob:getBehavior(), invaderXim.behavior.NO_TURN))
    end

    return dmg
end

return mobskillObject
