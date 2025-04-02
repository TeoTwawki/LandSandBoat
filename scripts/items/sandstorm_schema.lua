-----------------------------------
-- ID: 6053
-- Sandstorm Schema
-- Teaches the white magic Sandstorm
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SANDSTORM)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SANDSTORM)
end

return itemObject
