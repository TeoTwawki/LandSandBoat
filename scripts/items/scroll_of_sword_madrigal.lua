-----------------------------------
-- ID: 5007
-- Scroll of Sword Madrigal
-- Teaches the song Sword Madrigal
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SWORD_MADRIGAL)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SWORD_MADRIGAL)
end

return itemObject
