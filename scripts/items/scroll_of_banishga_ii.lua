-----------------------------------
-- ID: 4647
-- Scroll of Banishga II
-- Teaches the white magic Banishga II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BANISHGA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BANISHGA_II)
end

return itemObject
