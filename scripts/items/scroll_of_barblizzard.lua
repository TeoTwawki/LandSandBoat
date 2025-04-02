-----------------------------------
-- ID: 4669
-- Scroll of Barblizzard
-- Teaches the white magic Barblizzard
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARBLIZZARD)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARBLIZZARD)
end

return itemObject
