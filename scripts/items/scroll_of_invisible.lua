-----------------------------------
-- ID: 4744
-- Scroll of Invisible
-- Teaches the white magic Invisible
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INVISIBLE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INVISIBLE)
end

return itemObject
