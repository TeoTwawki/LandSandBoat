-----------------------------------
-- ID: 4774
-- Scroll of Thunder III
-- Teaches the black magic Thunder III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.THUNDER_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.THUNDER_III)
end

return itemObject
