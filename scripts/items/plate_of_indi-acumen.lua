-----------------------------------
-- ID: 6085
-- plate_of_indi-acumen
-- Teaches INDI-ACUMEN
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_ACUMEN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_ACUMEN)
end

return itemObject
