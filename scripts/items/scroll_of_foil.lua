-----------------------------------
-- ID: 5102
-- Scroll of Foil
-- Teaches the white magic Foil
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOIL)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOIL)
end

return itemObject
