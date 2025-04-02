-----------------------------------
-- ID: 4696
-- Scroll of Barparalyzra
-- Teaches the white magic Barparalyzra
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARPARALYZRA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARPARALYZRA)
end

return itemObject
