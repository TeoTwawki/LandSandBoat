-----------------------------------
-- ID: 5473
-- Item: Bastore Sweeper
-- Food Effect: 5 Min, Mithra only
-----------------------------------
-- Dexterity -5
-- Vitality +3
-- Defense +15% Cap 50
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5473)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -5)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FOOD_DEFP, 15)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -5)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FOOD_DEFP, 15)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 50)
end

return itemObject
