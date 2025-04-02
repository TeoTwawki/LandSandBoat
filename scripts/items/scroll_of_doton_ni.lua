-----------------------------------
-- ID: 4938
-- Scroll of Doton: ni
-- Teaches the ninjutsu Doton: ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DOTON_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DOTON_NI)
end

return itemObject
