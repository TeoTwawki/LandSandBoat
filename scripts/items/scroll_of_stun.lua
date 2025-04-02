-----------------------------------
-- ID: 4860
-- Scroll of Stun
-- Teaches the black magic Stun
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.STUN)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.STUN)
end

return itemObject
