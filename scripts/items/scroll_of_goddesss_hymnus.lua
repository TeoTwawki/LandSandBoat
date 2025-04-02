-----------------------------------
-- ID: 5072
-- Scroll of Goddess's Hymnus
-- Teaches the song Goddess's Hymnus
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.GODDESSS_HYMNUS)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.GODDESSS_HYMNUS)
end

return itemObject
