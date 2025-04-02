-----------------------------------
-- ID: 5017
-- Scroll of Scops Operetta
-- Teaches the song Scops Operetta
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SCOPS_OPERETTA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SCOPS_OPERETTA)
end

return itemObject
