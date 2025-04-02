-----------------------------------
-- ID: 4723
-- Scroll of Enblizzard II
-- Teaches the white magic Enblizzard II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ENBLIZZARD_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ENBLIZZARD_II)
end

return itemObject
