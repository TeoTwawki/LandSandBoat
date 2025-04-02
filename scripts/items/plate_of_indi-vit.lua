-----------------------------------
-- ID: 6078
-- plate_of_indi-vit
-- Teaches INDI-VIT
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_VIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_VIT)
end

return itemObject
