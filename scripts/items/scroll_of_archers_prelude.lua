-----------------------------------
-- ID: 5010
-- Scroll of Archers Prelude
-- Teaches the song Archers Prelude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(invaderXim.magic.spell.ARCHERS_PRELUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(invaderXim.magic.spell.ARCHERS_PRELUDE)
end

return itemObject
