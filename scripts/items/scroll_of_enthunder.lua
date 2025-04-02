-----------------------------------
-- ID: 4712
-- Scroll of Enthunder
-- Teaches the white magic Enthunder
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ENTHUNDER)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ENTHUNDER)
end

return itemObject
