-----------------------------------
-- ID: 4641
-- Scroll of Diaga
-- Teaches the white magic Diaga
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.DIAGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.DIAGA)
end

return itemObject
