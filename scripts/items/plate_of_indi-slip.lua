-----------------------------------
-- ID: 6095
-- plate_of_indi-slip
-- Teaches INDI-SLIP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_SLIP)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_SLIP)
end

return itemObject
