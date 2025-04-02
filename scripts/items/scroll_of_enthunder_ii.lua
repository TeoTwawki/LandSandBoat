-----------------------------------
-- ID: 4726
-- Scroll of Enthunder II
-- Teaches the white magic Enthunder II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ENTHUNDER_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ENTHUNDER_II)
end

return itemObject
