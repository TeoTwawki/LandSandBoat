-----------------------------------
-- ID: 6046
-- Item: Anemohelix Schema
-- Teaches the black magic Anemohelix
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ANEMOHELIX)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ANEMOHELIX)
end

return itemObject
