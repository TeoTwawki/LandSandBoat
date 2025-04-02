-----------------------------------
-- ID: 4947
-- Scroll of Utsusemi: Ni
-- Teaches the ninjutsu Utsusemi: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.UTSUSEMI_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.UTSUSEMI_NI)
end

return itemObject
