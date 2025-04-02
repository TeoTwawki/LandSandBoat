-----------------------------------
-- ID: 6073
-- plate_of_indi-regen
-- Teaches INDI-REGEN
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_REGEN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_REGEN)
end

return itemObject
