-----------------------------------
-- ID: 6089
-- plate_of_indi-focus
-- Teaches INDI-FOCUS
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_FOCUS)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_FOCUS)
end

return itemObject
