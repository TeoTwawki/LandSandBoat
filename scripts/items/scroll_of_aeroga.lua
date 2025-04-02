-----------------------------------
-- ID: 4792
-- Scroll of Aeroga
-- Teaches the black magic Aeroga
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AEROGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AEROGA)
end

return itemObject
