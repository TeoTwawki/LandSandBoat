-----------------------------------
-- ID: 5050
-- Scroll of Lightning Carol
-- Teaches the song Lightning Carol
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.LIGHTNING_CAROL)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.LIGHTNING_CAROL)
end

return itemObject
