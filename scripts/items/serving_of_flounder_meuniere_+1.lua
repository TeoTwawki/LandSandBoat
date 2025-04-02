-----------------------------------
-- ID: 4345
-- Item: serving_of_flounder_meuniere_+1
-- Food Effect: 240Min, All Races
-----------------------------------
-- Dexterity 6
-- Vitality 1
-- Mind -1
-- Ranged ACC 15
-- Ranged ATT % 14
-- Ranged ATT Cap 30
-- Enmity -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4345)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.RACC, 15)
    target:addMod(invaderXim.mod.FOOD_RATTP, 14)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 30)
    target:addMod(invaderXim.mod.ENMITY, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.RACC, 15)
    target:delMod(invaderXim.mod.FOOD_RATTP, 14)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 30)
    target:delMod(invaderXim.mod.ENMITY, -4)
end

return itemObject
