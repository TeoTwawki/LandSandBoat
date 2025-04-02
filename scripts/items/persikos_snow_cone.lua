-----------------------------------
-- ID: 6565
-- Item: Persikos Snow Cone
-- Food Effect: 5 minutes, all Races
-----------------------------------
-- MP +35% (Max. 50 @ 143 Base MP)
-- INT +3
-- [Element: Air]+5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 6565)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 35)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 50)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.WIND_MEVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 35)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 50)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.WIND_MEVA, 5)
end

return itemObject
