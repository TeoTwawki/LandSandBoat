-----------------------------------
-- ID: 4754
-- Scroll of Fire III
-- Teaches the black magic Fire III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FIRE_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FIRE_III)
end

return itemObject
