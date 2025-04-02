-----------------------------------
-- Holy Water - Removes Curse, Zombie, and Doom.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

local statii =
{
    invaderXim.effect.CURSE_I,
    invaderXim.effect.CURSE_II, -- AKA "Zombie"
    invaderXim.effect.BANE,
}

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 33 + target:getMod(invaderXim.mod.ENHANCES_HOLYWATER)
    local lastEffect = 0

    for _, effect in pairs(statii) do
        lastEffect = effect
        if target:hasStatusEffect(invaderXim.effect.DOOM) and power > math.random(1, 100) then
            target:delStatusEffect(invaderXim.effect.DOOM)
            target:messageBasic(invaderXim.msg.basic.NARROWLY_ESCAPE)
            skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
            return invaderXim.effect.DOOM
        else
            skill:setMsg(invaderXim.msg.basic.NO_EFFECT)
        end

        if target:hasStatusEffect(effect) then
            target:delStatusEffect(effect)
            skill:setMsg(invaderXim.msg.basic.SKILL_ERASE)
            return lastEffect
        else
            skill:setMsg(invaderXim.msg.basic.NO_EFFECT)
        end
    end
end

return mobskillObject
