-----------------------------------
-- ID: 5215
-- Item: plate_of_tentacle_sushi
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP 20
-- Dexterity 3
-- Agility 3
-- Mind -1
-- Accuracy % 20 (cap 18)
-- Ranged Accuracy % 20 (cap 18)
-- Double Attack 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5215)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.FOOD_ACCP, 20)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 18)
    target:addMod(invaderXim.mod.FOOD_RACCP, 20)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 18)
    target:addMod(invaderXim.mod.DOUBLE_ATTACK, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.FOOD_ACCP, 20)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 18)
    target:delMod(invaderXim.mod.FOOD_RACCP, 20)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 18)
    target:delMod(invaderXim.mod.DOUBLE_ATTACK, 1)
end

return itemObject
