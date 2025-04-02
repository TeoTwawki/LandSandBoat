-----------------------------------
-- ID: 4931
-- Scroll of Hyoton: Ni
-- Teaches the ninjutsu Hyoton: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HYOTON_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HYOTON_NI)
end

return itemObject
