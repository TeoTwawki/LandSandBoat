-----------------------------------
-- ID: 4554
-- Item: serving_of_shallops_tropicale
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic 20
-- Dexterity 1
-- Vitality 4
-- Intelligence 1
-- Defense % 25
-- Defense Cap 100
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4554)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 100)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 100)
end

return itemObject
