-----------------------------------
-- ID: 6050
-- Rainstorm Schema
-- Teaches the white magic Rainstorm
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RAINSTORM)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RAINSTORM)
end

return itemObject
