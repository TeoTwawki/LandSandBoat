-----------------------------------
-- ID: 4833
-- Scroll of Poisonga
-- Teaches the black magic Poisonga
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.POISONGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.POISONGA)
end

return itemObject
