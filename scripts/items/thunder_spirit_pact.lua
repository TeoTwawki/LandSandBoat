-----------------------------------
-- ID: 4900
-- Thunder Spirit Pact
-- Teaches the summoning magic Thunder Spirit
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.THUNDER_SPIRIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.THUNDER_SPIRIT)
end

return itemObject
