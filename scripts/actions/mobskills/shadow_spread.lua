-----------------------------------
-- Shadow Spread
-- Description: A dark shroud renders any nearby targets blinded, asleep, and cursed.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = 0
    local currentMsg = invaderXim.msg.basic.NONE

    local msg = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CURSE_I, 25, 0, 300)
    if msg == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.CURSE_I
        currentMsg = msg
    end

    msg = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 20, 0, 180)
    if msg == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.BLINDNESS
        currentMsg = msg
    end

    msg = invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, 30)
    if msg == invaderXim.msg.basic.SKILL_ENFEEB_IS then
        typeEffect = invaderXim.effect.SLEEP_I
        currentMsg = msg
    end

    skill:setMsg(currentMsg)

    return typeEffect
end

return mobskillObject
