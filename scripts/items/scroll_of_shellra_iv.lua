-----------------------------------
-- ID: 4741
-- Scroll of Shellra IV
-- Teaches the white magic Shellra IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHELLRA_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHELLRA_IV)
end

return itemObject
