-----------------------------------
-- ID: 4917
-- Scroll of Fira II
-- Teaches the black magic Fira II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.FIRA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.FIRA_II)
end

return itemObject
