-----------------------------------
-- ID: 4929
-- Scroll of Katon: Ni
-- Teaches the ninjutsu Katon: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.KATON_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.KATON_NI)
end

return itemObject
