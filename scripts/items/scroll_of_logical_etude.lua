-----------------------------------
-- ID: 5044
-- Scroll of Logical Etude
-- Teaches the song Logical Etude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.LOGICAL_ETUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.LOGICAL_ETUDE)
end

return itemObject
