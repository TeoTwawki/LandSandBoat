-----------------------------------
-- ID: 4956
-- Scroll of Kurayami: Ni
-- Teaches the ninjutsu Kurayami: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.KURAYAMI_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.KURAYAMI_NI)
end

return itemObject
