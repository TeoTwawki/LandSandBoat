-----------------------------------
-- ID: 11280
-- Item: Elder Gilet +1
-- Teleport's user to Purgonorgo Isle
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasVisitedZone(invaderXim.zone.BIBIKI_BAY) then
        result = 56
    end

    return result
end

itemObject.onItemUse = function(target)
    invaderXim.teleport.to(target, invaderXim.teleport.id.PURGONORGO)
end

return itemObject
