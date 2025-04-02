-----------------------------------
-- ID: 4336
-- Item: sweet_baked_apple
-- Food Effect: 1hour, All Races
-----------------------------------
-- Magic Points 25
-- Intelligence 4
-- MP Recovered While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4336)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 25)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 25)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
