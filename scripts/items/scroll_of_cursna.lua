-----------------------------------
-- ID: 4628
-- Scroll of Cursna
-- Teaches the white magic Cursna
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CURSNA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CURSNA)
end

return itemObject
