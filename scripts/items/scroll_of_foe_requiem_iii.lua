-----------------------------------
-- ID: 4978
-- Scroll of Foe Requiem III
-- Teaches the song Foe Requiem III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOE_REQUIEM_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOE_REQUIEM_III)
end

return itemObject
