-----------------------------------
-- ID: 6092
-- plate_of_indi-frailty
-- Teaches INDI-FRAILTY
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_FRAILTY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_FRAILTY)
end

return itemObject
