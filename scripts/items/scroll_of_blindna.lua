-----------------------------------
-- ID: 4624
-- Scroll of Blindna
-- Teaches the white magic Blindna
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.BLINDNA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.BLINDNA)
end

return itemObject
