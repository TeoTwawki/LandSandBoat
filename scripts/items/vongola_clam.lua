-----------------------------------
-- ID: 5131
-- Item: Vongola Clam
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity -5
-- Vitality 4
-- Defense +17% - 50 Cap
-- HP 5% - 50 Cap
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5131)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -5)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_DEFP, 17)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 50)
    target:addMod(invaderXim.mod.FOOD_HPP, 5)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -5)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_DEFP, 17)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 50)
    target:delMod(invaderXim.mod.FOOD_HPP, 5)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 50)
end

return itemObject
