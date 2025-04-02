-----------------------------------
-- ID: 4814
-- Scroll of Freeze
-- Teaches the black magic Freeze
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FREEZE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FREEZE)
end

return itemObject
