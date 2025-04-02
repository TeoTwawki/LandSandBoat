-----------------------------------
-- ID: 4609
-- Scroll of Cure
-- Teaches the white magic Cure
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CURE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CURE)
end

return itemObject
