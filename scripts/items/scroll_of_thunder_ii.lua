-----------------------------------
-- ID: 4773
-- Scroll of Thunder II
-- Teaches the black magic Thunder II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.THUNDER_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.THUNDER_II)
end

return itemObject
