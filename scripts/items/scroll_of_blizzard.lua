-----------------------------------
-- ID: 4757
-- Scroll of Blizzard
-- Teaches the black magic Blizzard
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BLIZZARD)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BLIZZARD)
end

return itemObject
