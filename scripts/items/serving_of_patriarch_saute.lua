-----------------------------------
-- ID: 5677
-- Item: Serving of Patriarch Sautee
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- MP 65
-- Mind 7
-- MP Recovered While Healing 7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5677)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 65)
    target:addMod(invaderXim.mod.MND, 7)
    target:addMod(invaderXim.mod.MPHEAL, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 65)
    target:delMod(invaderXim.mod.MND, 7)
    target:delMod(invaderXim.mod.MPHEAL, 7)
end

return itemObject
