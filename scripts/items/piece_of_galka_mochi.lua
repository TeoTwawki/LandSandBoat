-----------------------------------
-- ID: 5206
-- Piece of Galka Mochi
-- Enchantment: 60Min, Costume - Galka Child
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if not target:canUseMisc(invaderXim.zoneMisc.COSTUME) then
        return invaderXim.msg.basic.CANT_BE_USED_IN_AREA
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.COSTUME, 178, 0, 3600)
end

return itemObject
