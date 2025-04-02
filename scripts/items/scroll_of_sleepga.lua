-----------------------------------
-- ID: 4881
-- Scroll of Sleepga
-- Teaches the black magic Sleepga
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SLEEPGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SLEEPGA)
end

return itemObject
