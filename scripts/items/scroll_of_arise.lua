-----------------------------------
-- ID: 5101
-- Scroll of Arise
-- Teaches the white magic Arise
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ARISE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ARISE)
end

return itemObject
