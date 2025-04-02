-----------------------------------
-- ID: 5103
-- Scroll of Crusade
-- Teaches the white magic Crusade
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CRUSADE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CRUSADE)
end

return itemObject
