-----------------------------------
-- ID: 16273
-- Chocobo Pullus Torque
-- Enchantment: 60Min, Costume - Mandragora
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
    target:addStatusEffect(invaderXim.effect.COSTUME, 1997, 0, 3600)
end

return itemObject
