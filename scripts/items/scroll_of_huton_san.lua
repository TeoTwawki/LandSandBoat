-----------------------------------
-- ID: 4936
-- Scroll of Huton: San
-- Teaches the ninjutsu Huton: San
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.HUTON_SAN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.HUTON_SAN)
end

return itemObject
