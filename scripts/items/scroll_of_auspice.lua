-----------------------------------
-- ID: 4704
-- Scroll of Auspice
-- Teaches the white magic Auspice
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AUSPICE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AUSPICE)
end

return itemObject
