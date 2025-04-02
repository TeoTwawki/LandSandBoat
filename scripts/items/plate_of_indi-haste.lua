-----------------------------------
-- ID: 6131
-- plate_of_indi-haste
-- Teaches INDI-HASTE
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_HASTE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_HASTE)
end

return itemObject
