-----------------------------------
-- ID: 14663
-- Teleport ring: Mea
-- Enchantment: "Teleport-Mea"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasKeyItem(invaderXim.ki.MEA_GATE_CRYSTAL) then
        result = 445
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.MEA, 0, 4)
end

return itemObject
