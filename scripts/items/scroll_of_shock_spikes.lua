-----------------------------------
-- ID: 4859
-- Scroll of Shock Spikes
-- Teaches the black magic Shock Spikes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHOCK_SPIKES)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHOCK_SPIKES)
end

return itemObject
