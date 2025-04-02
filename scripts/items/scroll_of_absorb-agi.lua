-----------------------------------
-- ID: 4877
-- Scroll of Absorb-AGI
-- Teaches the black magic Absorb-AGI
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ABSORB_AGI)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ABSORB_AGI)
end

return itemObject
