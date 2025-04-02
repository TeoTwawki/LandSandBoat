-----------------------------------
-- ID: 5877
-- Item: Terror Screen
-- Effect: 2 Mins of immunity to "Terror" effects.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(invaderXim.effect.NEGATE_TERROR) then
        return 56
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.NEGATE_TERROR, 1, 0, 120)
end

return itemObject
