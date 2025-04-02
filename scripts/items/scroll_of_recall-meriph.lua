-----------------------------------
-- ID: 4689
-- Scroll of Recall-Meriph
-- Teaches the white magic Recall-Meriph
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RECALL_MERIPH)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RECALL_MERIPH)
end

return itemObject
