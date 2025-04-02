-----------------------------------
-- ID: 4420
-- Item: bowl_of_tomato_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- Agility 3
-- Vitality -1
-- HP Recovered While Healing 5
-- Ranged Accuracy % 9 (cap 15)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4420)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.FOOD_RACCP, 9)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.FOOD_RACCP, 9)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

return itemObject
