-----------------------------------
-- ID: 4762
-- Scroll of Aero
-- Teaches the black magic Aero
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AERO)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AERO)
end

return itemObject
