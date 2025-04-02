-----------------------------------
-- ID: 4977
-- Scroll of Foe Requiem II
-- Teaches the song Foe Requiem II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOE_REQUIEM_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOE_REQUIEM_II)
end

return itemObject
