-----------------------------------
-- ID: 5027
-- Scroll of Advancing March
-- Teaches the song Advancing March
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ADVANCING_MARCH)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ADVANCING_MARCH)
end

return itemObject
