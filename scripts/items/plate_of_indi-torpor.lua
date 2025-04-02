-----------------------------------
-- ID: 6096
-- plate_of_indi-torpor
-- Teaches INDI-TORPOR
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_TORPOR)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_TORPOR)
end

return itemObject
