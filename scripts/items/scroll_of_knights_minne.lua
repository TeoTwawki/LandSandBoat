-----------------------------------
-- ID: 4997
-- Scroll of Knights Minne
-- Teaches the song Mages Ballad
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.KNIGHTS_MINNE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.KNIGHTS_MINNE)
end

return itemObject
