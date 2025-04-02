-----------------------------------
-- ID: 5089
-- Scroll of Gain-VIT
-- Teaches the white magic Gain-VIT
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.GAIN_VIT)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.GAIN_VIT)
end

return itemObject
