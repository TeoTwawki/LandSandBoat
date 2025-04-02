-----------------------------------
-- ID: 14662
-- Teleport ring: Dem
-- Enchantment: "Teleport-Dem"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasKeyItem(invaderXim.ki.DEM_GATE_CRYSTAL) then
        result = 445
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.DEM, 0, 4)
end

return itemObject
