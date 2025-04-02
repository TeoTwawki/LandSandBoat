-----------------------------------
-- ID: 4794
-- Scroll of Aeroga III
-- Teaches the black magic Aeroga III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AEROGA_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AEROGA_III)
end

return itemObject
