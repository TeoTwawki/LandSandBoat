-----------------------------------
-- ID: 5200
-- Item: dish_of_spaghetti_pescatora_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health % 15
-- Health Cap 160
-- Vitality 3
-- Mind -1
-- Defense % 22
-- Defense Cap 70
-- Store TP 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5200)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 15)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 160)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.FOOD_DEFP, 22)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 70)
    target:addMod(invaderXim.mod.STORETP, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 15)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 160)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.FOOD_DEFP, 22)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 70)
    target:delMod(invaderXim.mod.STORETP, 6)
end

return itemObject
