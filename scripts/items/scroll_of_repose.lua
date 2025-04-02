-----------------------------------
-- ID: 4721
-- Scroll of Repose
-- Teaches the white magic Repose
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.REPOSE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.REPOSE)
end

return itemObject
