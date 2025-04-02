-----------------------------------
-- ID: 4895
-- Scroll of Waterja
-- Teaches the Black magic Waterja
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WATERJA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WATERJA)
end

return itemObject
