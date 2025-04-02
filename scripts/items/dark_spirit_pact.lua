-----------------------------------
-- ID: 4903
-- Dark Spirit Pact
-- Teaches the summoning magic Dark Spirit
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DARK_SPIRIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DARK_SPIRIT)
end

return itemObject
