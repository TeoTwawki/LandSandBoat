-----------------------------------
-- ID: 4875
-- Scroll of Absorb-DEX
-- Teaches the black magic Absorb-DEX
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ABSORB_DEX)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ABSORB_DEX)
end

return itemObject
