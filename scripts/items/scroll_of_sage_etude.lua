-----------------------------------
-- ID: 5043
-- Scroll of Sage Etude
-- Teaches the song Sage Etude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SAGE_ETUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SAGE_ETUDE)
end

return itemObject
