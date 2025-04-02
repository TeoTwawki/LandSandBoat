-----------------------------------
-- ID: 4878
-- Scroll of Absorb-INT
-- Teaches the black magic Absorb-INT
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ABSORB_INT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ABSORB_INT)
end

return itemObject
