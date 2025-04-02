-----------------------------------
-- ID: 4953
-- Scroll of Hojo: Ni
-- Teaches the ninjutsu Hojo: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HOJO_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HOJO_NI)
end

return itemObject
