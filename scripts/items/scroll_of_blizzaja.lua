
-----------------------------------
-- ID: 4891
-- Scroll of blizzaja
-- Teaches the black magic blizzaja
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BLIZZAJA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BLIZZAJA)
end

return itemObject
