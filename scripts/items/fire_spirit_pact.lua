-----------------------------------
-- ID: 4896
-- Fire Spirit Pact
-- Teaches the summoning magicFire Spirit
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FIRE_SPIRIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FIRE_SPIRIT)
end

return itemObject
