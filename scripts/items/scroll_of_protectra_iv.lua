-----------------------------------
-- ID: 4736
-- Scroll of Protectra IV
-- Teaches the white magic Protectra IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.PROTECTRA_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.PROTECTRA_IV)
end

return itemObject
