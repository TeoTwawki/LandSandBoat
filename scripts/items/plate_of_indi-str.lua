-----------------------------------
-- ID: 6076
-- plate_of_indi-str
-- Teaches INDI-STR
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_STR)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_STR)
end

return itemObject
