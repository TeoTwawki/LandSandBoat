-----------------------------------
-- ID: 4882
-- Scroll of Sleepga II
-- Teaches the black magic Sleepga II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SLEEPGA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SLEEPGA_II)
end

return itemObject
