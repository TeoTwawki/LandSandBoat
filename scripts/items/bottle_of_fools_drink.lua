-----------------------------------
-- ID: 5435
-- Item: bottle_of_fools_drink
-- Item Effect: When applied, grants UDMGMAGIC -10000 for 60s
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect        = invaderXim.effect.MAGIC_SHIELD
    local duration      = 60
    local power         = 1
    local nospellimmune = 0

    invaderXim.itemUtils.addItemShield(target, power, duration, effect, nospellimmune)
end

return itemObject
