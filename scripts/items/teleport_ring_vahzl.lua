-----------------------------------
-- ID: 14664
-- Teleport ring: Vahzl
-- Enchantment: "Teleport-Vahzl"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasKeyItem(invaderXim.ki.VAHZL_GATE_CRYSTAL) then
        result = 445
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.VAHZL, 0, 4)
end

return itemObject
