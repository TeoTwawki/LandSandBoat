-----------------------------------
-- ID: 5197
-- Item: dish_of_spaghetti_peperoncino_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health % 30
-- Health Cap 75
-- Vitality 2
-- Store TP 6
-- Resist virus +12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5197)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 30)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 75)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addMod(invaderXim.mod.VIRUSRES, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 30)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 75)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delMod(invaderXim.mod.VIRUSRES, 12)
end

return itemObject
