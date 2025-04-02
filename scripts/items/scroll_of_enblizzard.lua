-----------------------------------
-- ID: 4709
-- Scroll of Enblizzard
-- Teaches the white magic Enblizzard
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ENBLIZZARD)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ENBLIZZARD)
end

return itemObject
