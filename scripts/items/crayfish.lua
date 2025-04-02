-----------------------------------
-- ID: 4472
-- Item: crayfish
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity -3
-- Vitality 1
-- defense +10% (unknown cap)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4472)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -3)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.FOOD_DEFP, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -3)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.FOOD_DEFP, 10)
end

return itemObject
