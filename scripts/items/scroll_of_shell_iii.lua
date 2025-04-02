-----------------------------------
-- ID: 4658
-- Scroll of Shell III
-- Teaches the white magic Shell III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHELL_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHELL_III)
end

return itemObject
