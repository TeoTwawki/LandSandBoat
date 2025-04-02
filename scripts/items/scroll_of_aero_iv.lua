-----------------------------------
-- ID: 4765
-- Scroll of Aero IV
-- Teaches the black magic Aero IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.AERO_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.AERO_IV)
end

return itemObject
