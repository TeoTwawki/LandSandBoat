-----------------------------------
-- ID: 5082
-- Scroll of Cura II
-- Teaches the white magic Cura II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CURA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CURA_II)
end

return itemObject
