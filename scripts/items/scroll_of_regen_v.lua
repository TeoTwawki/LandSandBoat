-----------------------------------
-- ID: 5086
-- Scroll of Regen V
-- Teaches the white magic Regen V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.REGEN_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.REGEN_V)
end

return itemObject
