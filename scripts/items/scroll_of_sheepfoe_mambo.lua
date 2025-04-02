-----------------------------------
-- ID: 5011
-- Scroll of Sheepfoe Mambo
-- Teaches the song Sheepfoe Mambo
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHEEPFOE_MAMBO)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHEEPFOE_MAMBO)
end

return itemObject
