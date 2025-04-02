-----------------------------------
-- ID: 4734
-- Scroll of Protectra II
-- Teaches the white magic Protectra II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.PROTECTRA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.PROTECTRA_II)
end

return itemObject
