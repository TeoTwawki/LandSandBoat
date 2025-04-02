-----------------------------------
-- ID: 13180
-- Item: Republic Stables Medal
-- Teleports to Chocobo Stables (Bastok)
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasVisitedZone(invaderXim.zone.BASTOK_MINES) then
        result = invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.CHOCO_BASTOK, 0, 4)
end

return itemObject
