-----------------------------------
-- ID: 4680
-- Scroll of Barsleep
-- Teaches the white magic Barsleep
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARSLEEP)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARSLEEP)
end

return itemObject
