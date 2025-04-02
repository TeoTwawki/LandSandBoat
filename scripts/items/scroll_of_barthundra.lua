-----------------------------------
-- ID: 4678
-- Scroll of Barthundra
-- Teaches the white magic Barthundra
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARTHUNDRA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARTHUNDRA)
end

return itemObject
