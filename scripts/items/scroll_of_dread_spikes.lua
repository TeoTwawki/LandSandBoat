-----------------------------------
-- ID: 4885
-- Scroll of Dread Spikes
-- Teaches the black magic Dread Spikes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DREAD_SPIKES)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DREAD_SPIKES)
end

return itemObject
