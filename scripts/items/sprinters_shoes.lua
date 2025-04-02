-----------------------------------
-- ID: 15754
-- Item: Sprinter's Shoes
-- Item Effect: Quickening for 60 minutes
-- Base speed 10% or +5
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.QUICKENING, 5, 0, 3600)
    target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.QUICKENING)
end

return itemObject
