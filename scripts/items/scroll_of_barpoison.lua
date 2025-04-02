-----------------------------------
-- ID: 4681
-- Scroll of Barpoison
-- Teaches the white magic Barpoison
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARPOISON)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARPOISON)
end

return itemObject
