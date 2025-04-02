-----------------------------------
-- ID: 6369
-- Rune Fencer Die
-- Teaches the job ability Runeist's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(invaderXim.jobAbility.RUNEISTS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(invaderXim.jobAbility.RUNEISTS_ROLL)
end

return itemObject
