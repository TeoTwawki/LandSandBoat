-----------------------------------
-- ID: 6060
-- Item: Animus Minuo Schema
-- Teaches the white magic Animus Minuo
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ANIMUS_MINUO)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ANIMUS_MINUO)
end

return itemObject
