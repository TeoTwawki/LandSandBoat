-----------------------------------
-- ID: 5075
-- Scroll of Raptor Mazurka
-- Teaches the song Raptor Mazurka
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RAPTOR_MAZURKA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RAPTOR_MAZURKA)
end

return itemObject
