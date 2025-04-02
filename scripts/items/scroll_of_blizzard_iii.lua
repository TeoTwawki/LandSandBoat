-----------------------------------
-- ID: 4759
-- Scroll of Blizzard III
-- Teaches the black magic Blizzard III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BLIZZARD_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BLIZZARD_III)
end

return itemObject
