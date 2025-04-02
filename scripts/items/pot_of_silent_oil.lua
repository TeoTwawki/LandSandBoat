-----------------------------------
-- ID: 4165
-- Silent oil
-- This lubricant cuts down 99.99% of all friction
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(invaderXim.effect.SNEAK) then
        target:addStatusEffect(invaderXim.effect.SNEAK, 1, 10, math.floor(600 * invaderXim.settings.main.SNEAK_INVIS_DURATION_MULTIPLIER))
    end
end

return itemObject
