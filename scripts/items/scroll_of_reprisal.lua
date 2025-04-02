-----------------------------------
-- ID: 4715
-- Scroll of Reprisal
-- Teaches the white magic Reprisal
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.REPRISAL)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.REPRISAL)
end

return itemObject
