-----------------------------------
-- ID: 4858
-- Scroll of Ice Spikes
-- Teaches the black magic Ice Spikes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ICE_SPIKES)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ICE_SPIKES)
end

return itemObject
