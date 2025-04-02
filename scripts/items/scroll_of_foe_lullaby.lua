-----------------------------------
-- ID: 5071
-- Scroll of Foe Lullaby
-- Teaches the song Foe Lullaby
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOE_LULLABY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOE_LULLABY)
end

return itemObject
