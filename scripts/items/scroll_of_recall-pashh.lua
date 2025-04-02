-----------------------------------
-- ID: 4688
-- Scroll of Recall-Pashh
-- Teaches the white magic Recall-Pashh
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RECALL_PASHH)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RECALL_PASHH)
end

return itemObject
