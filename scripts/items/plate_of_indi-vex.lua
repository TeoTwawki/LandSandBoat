-----------------------------------
-- ID: 6097
-- plate_of_indi-vex
-- Teaches INDI-VEX
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_VEX)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_VEX)
end

return itemObject
