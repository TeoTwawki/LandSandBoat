-----------------------------------
-- ID: 6099
-- plate_of_indi-slow
-- Teaches INDI-SLOW
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_SLOW)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_SLOW)
end

return itemObject
