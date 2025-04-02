-----------------------------------
-- ID: 4653
-- Scroll of Protect III
-- Teaches the white magic Protect III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.PROTECT_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.PROTECT_III)
end

return itemObject
