-----------------------------------
-- ID: 4899
-- Earth Spirit Pact
-- Teaches the summoning magic Earth Spirit
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.EARTH_SPIRIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.EARTH_SPIRIT)
end

return itemObject
