-----------------------------------
-- ID: 4731
-- Scroll of Teleport-Dem
-- Teaches the white magic Teleport-Dem
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.TELEPORT_DEM)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.TELEPORT_DEM)
end

return itemObject
