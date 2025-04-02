-----------------------------------
-- ID: 4935
-- Scroll of Huton: Ni
-- Teaches the ninjutsu Huton: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HUTON_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HUTON_NI)
end

return itemObject
