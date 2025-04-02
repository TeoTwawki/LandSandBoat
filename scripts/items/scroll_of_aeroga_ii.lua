-----------------------------------
-- ID: 4793
-- Scroll of Aeroga II
-- Teaches the black magic Aeroga II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AEROGA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AEROGA_II)
end

return itemObject
