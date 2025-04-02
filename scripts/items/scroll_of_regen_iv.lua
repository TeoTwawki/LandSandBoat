-----------------------------------
-- ID: 5085
-- Scroll of Regen IV
-- Teaches the white magic Regen IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.REGEN_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.REGEN_IV)
end

return itemObject
