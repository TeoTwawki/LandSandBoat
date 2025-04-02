-----------------------------------
-- ID: 4705
-- Scroll of Temper
-- Teaches the white magic Temper
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.TEMPER)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.TEMPER)
end

return itemObject
