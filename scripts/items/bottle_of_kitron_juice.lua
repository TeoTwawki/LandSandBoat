-----------------------------------
-- ID: 5932
-- Item: Bottle of Kitron Juice
-- Item Effect: Restores 180 MP over 180 seconds.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.REFRESH) then
        target:addStatusEffect(invaderXim.effect.REFRESH, 3, 3, 180)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
