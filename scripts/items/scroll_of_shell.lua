-----------------------------------
-- ID: 4656
-- Scroll of Shell
-- Teaches the white magic Shell
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.SHELL)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.SHELL)
end

return itemObject
