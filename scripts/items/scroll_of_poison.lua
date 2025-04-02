-----------------------------------
-- ID: 4828
-- Scroll of Poison
-- Teaches the black magic Poison
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.POISON)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.POISON)
end

return itemObject
