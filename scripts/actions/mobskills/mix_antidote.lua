-----------------------------------
-- Mix: Antidote - Removes Poison Monberaux will not remove the effects
-- of Poison Potion or other consumables like it.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

-- TODO: verify no effect messaging
mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:hasStatusEffect(invaderXim.effect.POISON) then
        skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
        target:delStatusEffect(invaderXim.effect.POISON)
        return invaderXim.effect.POISON
    else
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT) -- NO_EFFECT also works.
    end
end

return mobskillObject
