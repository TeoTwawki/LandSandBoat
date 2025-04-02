-----------------------------------
-- ID: 5770
-- Item: Super Reraiser
-- Item Effect: This potion functions the same way as the spell Reraise.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local duration = 3600
    target:delStatusEffect(invaderXim.effect.RERAISE)
    target:addStatusEffect(invaderXim.effect.RERAISE, 3, 0, duration)
end

return itemObject
