-----------------------------------
-- ID: 4662
-- Scroll of Stoneskin
-- Teaches the white magic Stoneskin
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STONESKIN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STONESKIN)
end

return itemObject
