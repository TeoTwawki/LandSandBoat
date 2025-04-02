-----------------------------------
-- ID: 5104
-- Scroll of Flurry
-- Teaches the white magic Flurry
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FLURRY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FLURRY)
end

return itemObject
