-----------------------------------
-- ID: 6055
-- Item: Aurorastorm Schema
-- Teaches the white magic Aurorastorm
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AURORASTORM)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AURORASTORM)
end

return itemObject
