-----------------------------------
-- ID: 4620
-- Scroll of Raise
-- Teaches the white magic Raise
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RAISE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RAISE)
end

return itemObject
