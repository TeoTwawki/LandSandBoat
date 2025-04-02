-----------------------------------
-- ID: 4749
-- Scroll of Reraise II
-- Teaches the white magic Reraise II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RERAISE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RERAISE_II)
end

return itemObject
