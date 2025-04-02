-----------------------------------
-- ID: 4697
-- Scroll of Barblindra
-- Teaches the white magic Barblindra
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARBLINDRA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARBLINDRA)
end

return itemObject
