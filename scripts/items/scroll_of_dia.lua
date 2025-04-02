-----------------------------------
-- ID: 4631
-- Scroll of Dia
-- Teaches the white magic Dia
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DIA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DIA)
end

return itemObject
