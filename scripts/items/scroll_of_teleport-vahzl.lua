-----------------------------------
-- ID: 4747
-- Scroll of Teleport-Vahzl
-- Teaches the white magic Teleport-Vahzl
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.TELEPORT_VAHZL)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.TELEPORT_VAHZL)
end

return itemObject
