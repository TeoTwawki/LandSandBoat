-----------------------------------
-- ID: 6087
-- plate_of_indi-precision
-- Teaches INDI-PRECISION
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_PRECISION)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_PRECISION)
end

return itemObject
