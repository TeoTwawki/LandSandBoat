-----------------------------------
-- ID: 4819
-- Scroll of Quake II
-- Teaches the black magic Quake II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.QUAKE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.QUAKE_II)
end

return itemObject
