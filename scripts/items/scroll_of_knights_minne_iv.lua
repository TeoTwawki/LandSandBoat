-----------------------------------
-- ID: 5000
-- Scroll of Knights Minne IV
-- Teaches the song Mages Ballad IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.KNIGHTS_MINNE_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.KNIGHTS_MINNE_IV)
end

return itemObject
