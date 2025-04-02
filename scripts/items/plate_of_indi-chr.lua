-----------------------------------
-- ID: 6082
-- plate_of_indi-chr
-- Teaches INDI-CHR
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.INDI_CHR)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.INDI_CHR)
end

return itemObject
