-----------------------------------
-- ID: 4657
-- Scroll of Shell II
-- Teaches the white magic Shell II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHELL_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHELL_II)
end

return itemObject
