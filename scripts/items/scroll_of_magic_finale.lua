-----------------------------------
-- ID: 5070
-- Scroll of Magic Finale
-- Teaches the song Magic Finale
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.MAGIC_FINALE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.MAGIC_FINALE)
end

return itemObject
