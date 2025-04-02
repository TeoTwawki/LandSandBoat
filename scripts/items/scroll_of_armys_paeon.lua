-----------------------------------
-- ID: 4986
-- Scroll of Armys Paeton
-- Teaches the song Armys Paeton
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ARMYS_PAEON)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ARMYS_PAEON)
end

return itemObject
