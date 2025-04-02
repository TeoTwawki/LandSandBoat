-----------------------------------
-- ID: 4743
-- Scroll of Reraise
-- Teaches the white magic Reraise
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RERAISE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RERAISE)
end

return itemObject
