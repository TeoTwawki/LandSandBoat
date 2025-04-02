-----------------------------------
-- ID: 4799
-- Scroll of Stonega III
-- Teaches the black magic Stonega III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STONEGA_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STONEGA_III)
end

return itemObject
