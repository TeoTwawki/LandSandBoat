-----------------------------------
-- ID: 4861
-- Scroll of Sleep
-- Teaches the black magic Sleep
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SLEEP)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SLEEP)
end

return itemObject
