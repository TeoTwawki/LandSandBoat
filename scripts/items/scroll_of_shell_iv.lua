-----------------------------------
-- ID: 4659
-- Scroll of Shell IV
-- Teaches the white magic Shell IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHELL_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHELL_IV)
end

return itemObject
