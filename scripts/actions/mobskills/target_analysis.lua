-----------------------------------
-- Target Analysis
-- Description: AoE Absorb All with randomness
-- Type: Magical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

local attributesDown =
{
    invaderXim.effect.STR_DOWN,
    invaderXim.effect.DEX_DOWN,
    invaderXim.effect.VIT_DOWN,
    invaderXim.effect.AGI_DOWN,
    invaderXim.effect.MND_DOWN,
    invaderXim.effect.INT_DOWN,
    invaderXim.effect.CHR_DOWN,
}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local skillList = mob:getMobMod(invaderXim.mobMod.SKILL_LIST)
    local mobhp = mob:getHPP()

    if
        (skillList == 54 and mobhp < 25) or
        (skillList == 727 and mob:getAnimationSub() == 1)
    then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local drained = 0

    for i = 1, 7 do
        if math.random(0, 100) < 40 then
            skill:setMsg(invaderXim.mobskills.mobDrainAttribute(mob, target, attributesDown[i], 10, 3, 60))
            drained = drained + 1
        end
    end

    return drained
end

return mobskillObject
