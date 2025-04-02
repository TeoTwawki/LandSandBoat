-----------------------------------
-- ID: 5123
-- Item: Jacknife
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity -5
-- Vitality 4
-- Defence 16% Cap 50
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5123)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -5)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_DEFP, 16)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -5)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_DEFP, 16)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 50)
end

return itemObject
