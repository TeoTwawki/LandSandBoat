-----------------------------------
-- ID: 4897
-- Ice Spirit Pact
-- Teaches the summoning magic ice Spirit
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ICE_SPIRIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ICE_SPIRIT)
end

return itemObject
