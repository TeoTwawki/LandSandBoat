-----------------------------------
-- ID: 4784
-- Scroll of Firaga III
-- Teaches the black magic Firaga III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FIRAGA_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FIRAGA_III)
end

return itemObject
