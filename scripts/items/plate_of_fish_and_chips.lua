-----------------------------------
-- ID: 5145
-- Item: plate_of_fish_and_chips
-- Food Effect: 180Min, All Races
-----------------------------------
-- Dexterity 3
-- Vitality 3
-- Mind -3
-- defense 5
-- Ranged ATT % 7
-- Ranged ATT Cap 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5145)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.DEF, 5)
    target:addMod(invaderXim.mod.FOOD_RATTP, 7)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.DEF, 5)
    target:delMod(invaderXim.mod.FOOD_RATTP, 7)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 10)
end

return itemObject
