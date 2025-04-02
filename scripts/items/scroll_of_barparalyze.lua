-----------------------------------
-- ID: 4682
-- Scroll of Barparalyze
-- Teaches the white magic Barparalyze
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARPARALYZE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARPARALYZE)
end

return itemObject
