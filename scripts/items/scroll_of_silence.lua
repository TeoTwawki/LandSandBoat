-----------------------------------
-- ID: 4667
-- Scroll of Silence
-- Teaches the white magic Silence
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SILENCE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SILENCE)
end

return itemObject
