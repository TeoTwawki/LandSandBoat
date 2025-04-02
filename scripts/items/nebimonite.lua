-----------------------------------
-- ID: 4361
-- Item: nebimonite
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity -3
-- Vitality 2
-- Defense % 13 (cap 50)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4361)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -3)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.FOOD_DEFP, 13)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -3)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.FOOD_DEFP, 13)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 50)
end

return itemObject
