-----------------------------------
-- Mix: Samson's Strength - Gives all primary stats +10 for 60 seconds.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

local statii =
{
    invaderXim.effect.STR_BOOST,
    invaderXim.effect.DEX_BOOST,
    invaderXim.effect.VIT_BOOST,
    invaderXim.effect.AGI_BOOST,
    invaderXim.effect.INT_BOOST,
    invaderXim.effect.MND_BOOST,
    invaderXim.effect.CHR_BOOST,
}

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:getID() == mob:getID() then
        skill:setMsg(762) -- Monberaux uses Mix: {ID} -- All of Monberaux's status parameters are boosted.
    else
        skill:setMsg(365) -- All of targets's status parameters are boosted.
    end

    for _, effect in pairs(statii) do
        if not target:hasStatusEffect(effect) then
            target:addStatusEffect(effect, 10, 0, 60)
        end
    end

    -- What happens if no effect?
    return invaderXim.effect.VIT_BOOST_II -- VIT_BOOST_II = 121
end

return mobskillObject
