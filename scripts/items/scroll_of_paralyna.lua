-----------------------------------
-- ID: 4623
-- Scroll of Paralyna
-- Teaches the white magic Paralyna
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.PARALYNA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.PARALYNA)
end

return itemObject
