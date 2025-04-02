-----------------------------------
-- ID: 4942
-- Scroll of Raiton: San
-- Teaches the ninjutsu Raiton: San
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.RAITON_SAN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.RAITON_SAN)
end

return itemObject
