-----------------------------------
-- ID: 4857
-- Scroll of Blaze Spikes
-- Teaches the black magic Blaze Spikes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BLAZE_SPIKES)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BLAZE_SPIKES)
end

return itemObject
