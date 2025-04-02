-----------------------------------
-- ID: 4945
-- Scroll of Suiton: San
-- Teaches the ninjutsu Suiton: San
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SUITON_SAN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SUITON_SAN)
end

return itemObject
