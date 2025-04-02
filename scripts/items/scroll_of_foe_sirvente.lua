-----------------------------------
-- ID: 5076
-- Scroll of Foe Sirvente
-- Teaches the song Foe Sirvente
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOE_SIRVENTE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOE_SIRVENTE)
end

return itemObject
