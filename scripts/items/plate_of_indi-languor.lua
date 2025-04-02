-----------------------------------
-- ID: 6098
-- plate_of_indi-languor
-- Teaches INDI-LANGUOR
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_LANGUOR)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_LANGUOR)
end

return itemObject
