-----------------------------------
-- ID: 15543
-- Rajas Ring
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
end

itemObject.onItemUse = function(target)
end

itemObject.onItemDrop = function(target, item)
    invaderXim.mission.setVar(target, invaderXim.mission.log_id.COP, invaderXim.mission.id.cop.DAWN, 'Timer', 1, os.time() + 27 * 24 * 60 * 60)
end

return itemObject
