-----------------------------------
-- ID: 4991
-- Scroll of Armys Paeton VI
-- Teaches the song Armys Paeton VI
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ARMYS_PAEON_VI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ARMYS_PAEON_VI)
end

return itemObject
