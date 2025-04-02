-----------------------------------
--  ID: 16003
--  Reraise Earring
--  This earring functions in the same way as the spell Reraise.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local duration = 2100
    target:delStatusEffect(invaderXim.effect.RERAISE)
    target:addStatusEffect(invaderXim.effect.RERAISE, 1, 0, duration)
end

return itemObject
