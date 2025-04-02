-----------------------------------
-- ID: 6074
-- plate_of_indi-poison
-- Teaches INDI-POISON
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_POISON)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_POISON)
end

return itemObject
