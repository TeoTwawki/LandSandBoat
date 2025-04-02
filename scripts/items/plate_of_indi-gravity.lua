-----------------------------------
-- ID: 6101
-- plate_of_indi-gravity
-- Teaches INDI-GRAVITY
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_GRAVITY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_GRAVITY)
end

return itemObject
