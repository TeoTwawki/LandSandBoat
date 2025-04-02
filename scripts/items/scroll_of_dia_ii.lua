-----------------------------------
-- ID: 4632
-- Scroll of Dia II
-- Teaches the white magic Dia II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DIA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DIA_II)
end

return itemObject
