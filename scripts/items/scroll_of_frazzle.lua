-----------------------------------
-- ID: 4914
-- Scroll of Frazzle
-- Teaches the black magic Frazzle
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FRAZZLE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FRAZZLE)
end

return itemObject
