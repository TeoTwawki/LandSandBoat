-----------------------------------
-- ID: 4883
-- Scroll of Absorb-TP
-- Teaches the black magic Absorb-TP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ABSORB_TP)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ABSORB_TP)
end

return itemObject
