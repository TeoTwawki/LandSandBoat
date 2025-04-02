-----------------------------------
--  ID: 15698
--  Sneaking Boots
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:delStatusEffect(invaderXim.effect.SNEAK)
    target:addStatusEffect(invaderXim.effect.SNEAK, 1, 0, math.floor(180 * invaderXim.settings.main.SNEAK_INVIS_DURATION_MULTIPLIER))
end

return itemObject
