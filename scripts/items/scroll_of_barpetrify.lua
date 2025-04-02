-----------------------------------
-- ID: 4685
-- Scroll of Barpetrify
-- Teaches the white magic Barpetrify
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARPETRIFY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARPETRIFY)
end

return itemObject
