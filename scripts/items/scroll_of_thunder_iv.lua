-----------------------------------
-- ID: 4775
-- Scroll of Thunder IV
-- Teaches the black magic Thunder IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.THUNDER_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.THUNDER_IV)
end

return itemObject
