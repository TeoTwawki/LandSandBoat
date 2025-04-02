-----------------------------------
-- ID: 4625
-- Scroll of Silena
-- Teaches the white magic Silena
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SILENA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SILENA)
end

return itemObject
