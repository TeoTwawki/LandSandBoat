-----------------------------------
-- ID: 4787
-- Scroll of Blizzaga
-- Teaches the black magic Blizzaga
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BLIZZAGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BLIZZAGA)
end

return itemObject
