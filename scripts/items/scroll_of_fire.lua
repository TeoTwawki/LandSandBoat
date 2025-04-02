-----------------------------------
-- ID: 4752
-- Scroll of Fire
-- Teaches the black magic Fire
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FIRE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FIRE)
end

return itemObject
