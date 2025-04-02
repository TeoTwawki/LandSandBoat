-----------------------------------
-- ID: 5032
-- Scroll of Sinewy Etude
-- Teaches the song Sinewy Etude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SINEWY_ETUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SINEWY_ETUDE)
end

return itemObject
