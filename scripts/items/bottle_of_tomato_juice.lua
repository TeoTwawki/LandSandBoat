-----------------------------------
-- ID: 4425
-- Item: Tomato Juice
-- Item Effect: Restores 60 MP over 180 seconds.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.REFRESH) then
        target:addStatusEffect(invaderXim.effect.REFRESH, 1, 3, 180)
    else
        target:messageBasic(invaderXim.msg.basic.NO_EFFECT)
    end
end

return itemObject
