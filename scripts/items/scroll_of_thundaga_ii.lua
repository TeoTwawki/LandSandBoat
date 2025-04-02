-----------------------------------
-- ID: 4803
-- Scroll of Thundaga II
-- Teaches the black magic Thundaga II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.THUNDAGA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.THUNDAGA_II)
end

return itemObject
