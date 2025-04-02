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
    invaderXim.effect.DOOM,
}

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    for _, effect in pairs(statii) do
        target:delStatusEffect(effect)
    end

    return 0
end

return mobskillObject
