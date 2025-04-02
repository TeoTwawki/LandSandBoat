-----------------------------------
-- ID: 4825
-- Scroll of Gravity II
-- Teaches the black magic Gravity II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.GRAVITY_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.GRAVITY_II)
end

return itemObject
