-----------------------------------
-- ID: 5397
-- Item: bottle_of_sprinters_drink
-- Item Effect: Grants Flee for 60s
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect = invaderXim.effect.FLEE
    local power = 7500
    local duration = 60

    invaderXim.itemUtils.addItemEffect(target, effect, power, duration)
end

return itemObject
