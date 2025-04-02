-----------------------------------
-- ID: 4703
-- Scroll of Esuna
-- Teaches the white magic Esuna
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ESUNA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ESUNA)
end

return itemObject
