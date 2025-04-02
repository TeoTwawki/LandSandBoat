-----------------------------------
-- ID: 4716
-- Scroll of Regen
-- Teaches the white magic Regen
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.REGEN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.REGEN)
end

return itemObject
