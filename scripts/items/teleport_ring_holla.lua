-----------------------------------
-- ID: 14661
-- Teleport ring: Holla
-- Enchantment: "Teleport-Holla"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasKeyItem(invaderXim.ki.HOLLA_GATE_CRYSTAL) then
        result = 445
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.HOLLA, 0, 4)
end

return itemObject
