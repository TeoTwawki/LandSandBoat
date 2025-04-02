-----------------------------------
-- ID: 4872
-- Scroll of Tractor
-- Teaches the black magic Tractor
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.TRACTOR)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.TRACTOR)
end

return itemObject
