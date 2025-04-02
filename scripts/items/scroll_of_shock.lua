-----------------------------------
-- ID: 4847
-- Scroll of Shock
-- Teaches the black magic Shock
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHOCK)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHOCK)
end

return itemObject
