-----------------------------------
-- ID: 4999
-- Scroll of Knights Minne III
-- Teaches the song Mages Ballad III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.KNIGHTS_MINNE_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.KNIGHTS_MINNE_III)
end

return itemObject
