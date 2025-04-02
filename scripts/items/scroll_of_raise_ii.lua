-----------------------------------
-- ID: 4621
-- Scroll of Raise II
-- Teaches the white magic Raise II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RAISE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RAISE_II)
end

return itemObject
