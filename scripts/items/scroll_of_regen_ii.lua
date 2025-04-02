-----------------------------------
-- ID: 4718
-- Scroll of Regen II
-- Teaches the white magic Regen II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.REGEN_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.REGEN_II)
end

return itemObject
