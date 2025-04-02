-----------------------------------
-- ID: 4164
-- Prism Powder
-- When applied, it makes things invisible.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(invaderXim.effect.INVISIBLE) then
        target:delStatusEffect(invaderXim.effect.INVISIBLE)
    end

    target:addStatusEffect(invaderXim.effect.INVISIBLE, 1, 10, math.floor(600 * invaderXim.settings.main.SNEAK_INVIS_DURATION_MULTIPLIER))
end

return itemObject
