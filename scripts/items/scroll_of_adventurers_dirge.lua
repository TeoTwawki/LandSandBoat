-----------------------------------
-- ID: 5077
-- Scroll of Adventurer's Dirge
-- Teaches the song Adventurer's Dirge
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ADVENTURERS_DIRGE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ADVENTURERS_DIRGE)
end

return itemObject
