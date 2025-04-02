-----------------------------------
-- ID: 4886
-- Scroll of Absorb-ACC
-- Teaches the black magic Absorb-ACC
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ABSORB_ACC)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ABSORB_ACC)
end

return itemObject
