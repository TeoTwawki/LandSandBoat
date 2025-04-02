-----------------------------------
-- ID: 5192
-- Item: dish_of_spaghetti_boscaiola
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health % 18
-- Health Cap 120
-- Magic 35
-- Strength -5
-- Dexterity -2
-- Vitality 2
-- Mind 4
-- Store TP +6
-- Magic Regen While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5192)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 18)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 120)
    target:addMod(invaderXim.mod.FOOD_MP, 35)
    target:addMod(invaderXim.mod.STR, -5)
    target:addMod(invaderXim.mod.DEX, -2)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.MND, 4)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 18)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 120)
    target:delMod(invaderXim.mod.FOOD_MP, 35)
    target:delMod(invaderXim.mod.STR, -5)
    target:delMod(invaderXim.mod.DEX, -2)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.MND, 4)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
