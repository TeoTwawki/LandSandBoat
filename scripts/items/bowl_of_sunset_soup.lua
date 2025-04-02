-----------------------------------
-- ID: 4341
-- Item: bowl_of_sunset_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- Agility 3
-- Vitality -1
-- HP Recovered While Healing 5
-- Ranged Accuracy % 9 (cap 20)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4341)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.FOOD_RACCP, 9)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.FOOD_RACCP, 9)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

return itemObject
