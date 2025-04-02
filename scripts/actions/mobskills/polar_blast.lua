-----------------------------------
--  Polar Blast
--
--  Description: Deals Ice damage to enemies within a fan-shaped area. Additional effect: Paralyze
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

    if mob:getAnimationSub() <= 1 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.01, 0.1, invaderXim.element.ICE, 700)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 15, 0, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.ICE)

    if
        mob:getFamily() == 313 and
        bit.band(mob:getBehavior(), invaderXim.behavior.NO_TURN) == 0 and
        mob:getAnimationSub() == 1
    then
        -- re-enable no turn if third head is dead (Tinnin), else it's re-enabled after the upcoming Pyric Blast
        mob:setBehavior(bit.bor(mob:getBehavior(), invaderXim.behavior.NO_TURN))
    end

    return dmg
end

return mobskillObject
