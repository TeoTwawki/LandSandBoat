-----------------------------------
-- ID: 5013
-- Scroll of Fowl Aubade
-- Teaches the song Fowl Aubade
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOWL_AUBADE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOWL_AUBADE)
end

return itemObject
