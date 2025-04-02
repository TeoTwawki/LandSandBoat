-----------------------------------
-- ID: 4902
-- Light Spirit Pact
-- Teaches the summoning magic Air Spirit
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.LIGHT_SPIRIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.LIGHT_SPIRIT)
end

return itemObject
