-----------------------------------
-- ID: 6093
-- plate_of_indi-fade
-- Teaches INDI-FADE
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_FADE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_FADE)
end

return itemObject
