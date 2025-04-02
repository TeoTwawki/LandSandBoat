-----------------------------------
-- ID: 4893
-- Scroll of Stoneja
-- Teaches the black magic Stoneja
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STONEJA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STONEJA)
end

return itemObject
