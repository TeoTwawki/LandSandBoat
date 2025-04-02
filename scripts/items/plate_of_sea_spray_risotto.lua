-----------------------------------
-- ID: 4268
-- Item: plate_of_sea_spray_risotto
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP 45
-- Dexterity 6
-- Agility 3
-- Mind -4
-- HP Recovered While Healing 1
-- Accuracy % 6 (cap 20)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4268)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 45)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.MND, -4)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.FOOD_ACCP, 6)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 45)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.MND, -4)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.FOOD_ACCP, 6)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 20)
end

return itemObject
