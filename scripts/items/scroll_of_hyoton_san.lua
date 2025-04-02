-----------------------------------
-- ID: 4932
-- Scroll of Hyoton: San
-- Teaches the ninjutsu Hyoton: San
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HYOTON_SAN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HYOTON_SAN)
end

return itemObject
