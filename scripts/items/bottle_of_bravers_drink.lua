-----------------------------------
-- ID: 5390
-- Item: bottle_of_bravers_drink
-- Item Effect: all stats +15
-----------------------------------

---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local power     = 15
    local duration  = 180

    local effects =
    {
        invaderXim.effect.STR_BOOST_II,
        invaderXim.effect.DEX_BOOST_II,
        invaderXim.effect.VIT_BOOST_II,
        invaderXim.effect.AGI_BOOST_II,
        invaderXim.effect.INT_BOOST_II,
        invaderXim.effect.MND_BOOST_II,
        invaderXim.effect.CHR_BOOST_II
    }

    for _, effect in ipairs(effects) do
        target:addStatusEffect(effect, power, 0, duration)
    end
end

return itemObject
