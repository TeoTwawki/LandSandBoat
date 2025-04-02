-----------------------------------
-- ID: 4901
-- Water Spirit Pact
-- Teaches the summoning magic Water Spirit
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.WATER_SPIRIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.WATER_SPIRIT)
end

return itemObject
