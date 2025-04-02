-----------------------------------
-- ID: 4979
-- Scroll of Foe Requiem IV
-- Teaches the song Foe Requiem IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FOE_REQUIEM_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FOE_REQUIEM_IV)
end

return itemObject
