-----------------------------------
-- ID: 4789
-- Scroll of Blizzaga III
-- Teaches the black magic Blizzaga III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BLIZZAGA_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BLIZZAGA_III)
end

return itemObject
