-----------------------------------
--  Tribulation
--
--  Description: Inflicts Bio and blinds all targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: AoE
--  Notes: Bio effect can take away up to 39/tick.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = nil
    local blinded    = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 20, 0, 120)
    local bio        = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIO, 39, 0, 120)

    skill:setMsg(invaderXim.msg.basic.SKILL_ENFEEB_IS)

    -- display blind first, else bio
    if blinded == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.BLINDNESS
    elseif bio == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.BIO
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_MISS)
    end

    return typeEffect
end

return mobskillObject
