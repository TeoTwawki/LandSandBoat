-----------------------------------
-- ID: 5231
-- Item: truelove_chocolate
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- MP 10
-- MP Recovered While Healing 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5231)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.MPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.MPHEAL, 4)
end

return itemObject
