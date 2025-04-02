-----------------------------------
-- ID: 4822
-- Scroll of Flood
-- Teaches the black magic Flood
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FLOOD)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FLOOD)
end

return itemObject
