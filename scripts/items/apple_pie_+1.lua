-----------------------------------
-- ID: 4320
-- Item: Apple Pie +1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Magic 30
-- Intelligence 4
-- Magic Regen While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4320)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 30)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 30)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
