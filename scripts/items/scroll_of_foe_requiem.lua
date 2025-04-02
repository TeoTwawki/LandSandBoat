-----------------------------------
-- ID: 4976
-- Scroll of Foe Requiem
-- Teaches the song Foe Requiem
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOE_REQUIEM)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOE_REQUIEM)
end

return itemObject
