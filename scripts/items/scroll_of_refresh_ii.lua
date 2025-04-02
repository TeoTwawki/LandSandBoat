-----------------------------------
-- ID: 4850
-- Scroll of Refresh II
-- Teaches the white magic Refresh II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.REFRESH_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.REFRESH_II)
end

return itemObject
