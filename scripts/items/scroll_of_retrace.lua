-----------------------------------
-- ID: 4873
-- Scroll of Retrace
-- Teaches the black magic Retrace
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RETRACE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RETRACE)
end

return itemObject
