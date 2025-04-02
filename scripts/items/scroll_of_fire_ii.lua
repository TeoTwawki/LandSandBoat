-----------------------------------
-- ID: 4753
-- Scroll of Fire II
-- Teaches the black magic Fire II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FIRE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FIRE_II)
end

return itemObject
