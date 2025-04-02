-----------------------------------
-- ID: 4820
-- Scroll of Burst
-- Teaches the black magic Burst
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BURST)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BURST)
end

return itemObject
