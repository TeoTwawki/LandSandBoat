-----------------------------------
-- ID: 5030
-- Scroll of Carnage Elegy
-- Teaches the song Carnage Elegy
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.CARNAGE_ELEGY)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.CARNAGE_ELEGY)
end

return itemObject
