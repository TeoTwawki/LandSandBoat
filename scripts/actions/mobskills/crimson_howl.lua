-----------------------------------
-- Howl
--
-- Description: Grants the effect of Warcry to user and any linked allies.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self and nearby mobs of same family and/or force up to 20'.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.WARCRY, 25, 0, 180))

    return invaderXim.effect.WARCRY
end

return mobskillObject
