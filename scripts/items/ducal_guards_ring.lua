-----------------------------------
-- ID: 14657
-- Ducal Guard Ring
-- Enchantment: "Teleport-RuLude Gardens"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasVisitedZone(invaderXim.zone.RULUDE_GARDENS) then
        result = 56
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.DUCALGUARD, 0, 4)
end

return itemObject
