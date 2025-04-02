-----------------------------------
-- ID: 4982
-- Scroll of Foe Requiem VII
-- Teaches the song Foe Requiem VII
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOE_REQUIEM_VII)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOE_REQUIEM_VII)
end

return itemObject
