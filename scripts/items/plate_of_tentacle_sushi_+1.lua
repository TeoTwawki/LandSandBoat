-----------------------------------
-- ID: 5216
-- Item: plate_of_tentacle_sushi_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP 20
-- Dexterity 3
-- Agility 3
-- Accuracy % 20 (cap 20)
-- Ranged Accuracy % 20 (cap 20)
-- Double Attack 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5216)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.FOOD_ACCP, 20)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 20)
    target:addMod(invaderXim.mod.FOOD_RACCP, 20)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 20)
    target:addMod(invaderXim.mod.DOUBLE_ATTACK, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.FOOD_ACCP, 20)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 20)
    target:delMod(invaderXim.mod.FOOD_RACCP, 20)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 20)
    target:delMod(invaderXim.mod.DOUBLE_ATTACK, 1)
end

return itemObject
