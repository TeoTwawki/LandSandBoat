-----------------------------------
-- ID: 5079
-- Scroll of Foe Lullaby II
-- Teaches the song Foe Lullaby II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOE_LULLABY_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOE_LULLABY_II)
end

return itemObject
