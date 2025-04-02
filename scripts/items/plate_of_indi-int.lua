-----------------------------------
-- ID: 6080
-- plate_of_indi-int
-- Teaches INDI-INT
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_INT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_INT)
end

return itemObject
