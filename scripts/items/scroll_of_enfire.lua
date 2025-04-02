-----------------------------------
-- ID: 4708
-- Scroll of Enfire
-- Teaches the white magic Enfire
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ENFIRE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ENFIRE)
end

return itemObject
