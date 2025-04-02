-----------------------------------
-- ID: 6081
-- plate_of_indi-mnd
-- Teaches INDI-MND
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_MND)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_MND)
end

return itemObject
