-----------------------------------
-- ID: 4691
-- Scroll of Baramnesra
-- Teaches the white magic Baramnesra
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BARAMNESRA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BARAMNESRA)
end

return itemObject
