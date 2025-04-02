-----------------------------------
-- ID: 5658
-- Item: Dish of Spafhetti Ortolana
-- Food Effect: 30 Mins, All Races
-----------------------------------
-- Agility 2
-- Vitality 2
-- HP +30% Cap 70
-- StoreTP +6
-- Resist Blind +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5658)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.FOOD_HPP, 30)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 70)
    target:addMod(invaderXim.mod.STORETP, 6)
    target:addMod(invaderXim.mod.BLINDRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.FOOD_HPP, 30)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 70)
    target:delMod(invaderXim.mod.STORETP, 6)
    target:delMod(invaderXim.mod.BLINDRES, 10)
end

return itemObject
