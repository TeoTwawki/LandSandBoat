-----------------------------------
-- ID: 5352
-- Phial of spectral Serum
-- Enchantment: 60Min, Costume - ghost
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
    target:addStatusEffect(invaderXim.effect.COSTUME, 368, 0, 3600)
end

return itemObject
