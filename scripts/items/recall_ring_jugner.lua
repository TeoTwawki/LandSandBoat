-----------------------------------
-- ID: 15841
-- Recall ring: Jugner
-- Enchantment: "Recall-Jugner"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasKeyItem(invaderXim.ki.JUGNER_GATE_CRYSTAL) then
        result = 445
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.JUGNER, 0, 4)
end

return itemObject
