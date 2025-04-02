-----------------------------------
-- ID: 4797
-- Scroll of Stonega
-- Teaches the black magic Stonega
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STONEGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STONEGA)
end

return itemObject
