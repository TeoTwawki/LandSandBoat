-----------------------------------
-- ID: 4772
-- Scroll of Thunder
-- Teaches the black magic Thunder
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.THUNDER)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.THUNDER)
end

return itemObject
