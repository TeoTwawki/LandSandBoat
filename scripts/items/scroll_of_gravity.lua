-----------------------------------
-- ID: 4824
-- Scroll of Gravity
-- Teaches the black magic Gravity
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.GRAVITY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.GRAVITY)
end

return itemObject
