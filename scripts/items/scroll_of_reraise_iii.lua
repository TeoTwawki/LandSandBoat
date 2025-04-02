-----------------------------------
-- ID: 4750
-- Scroll of Reraise III
-- Teaches the white magic Reraise III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RERAISE_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RERAISE_III)
end

return itemObject
