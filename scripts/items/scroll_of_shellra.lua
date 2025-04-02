-----------------------------------
-- ID: 4738
-- Scroll of Shellra
-- Teaches the white magic Shellra
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHELLRA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHELLRA)
end

return itemObject
