-----------------------------------
-- ID: 4783
-- Scroll of Firaga II
-- Teaches the black magic Firaga II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FIRAGA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FIRAGA_II)
end

return itemObject
