-----------------------------------
-- ID: 16050
-- Nashmau Earring
-- Enchantment: "Teleport" (Nashmau)
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.NASHMAU_EARRING, 0, 4)
end

return itemObject
