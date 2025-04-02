-----------------------------------
-- ID: 4732
-- Scroll of Teleport-Mea
-- Teaches the white magic Teleport-Mea
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.TELEPORT_MEA)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.TELEPORT_MEA)
end

return itemObject
