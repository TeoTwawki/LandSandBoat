-----------------------------------
-- ID: 16041
-- Federation Earring
-- Enchantment: "Teleport" (Windurst Waters)
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.FEDERATION_EARRING, 0, 4)
end

return itemObject
