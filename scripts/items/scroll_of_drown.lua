-----------------------------------
-- ID: 4848
-- Scroll of Drown
-- Teaches the black magic Drown
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DROWN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DROWN)
end

return itemObject
