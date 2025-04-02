-----------------------------------
-- ID: 5001
-- Scroll of Knights Minne V
-- Teaches the song Mages Ballad V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.KNIGHTS_MINNE_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.KNIGHTS_MINNE_V)
end

return itemObject
