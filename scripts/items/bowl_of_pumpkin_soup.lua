-----------------------------------
-- ID: 4430
-- Item: bowl_of_pumpkin_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- HP % 1 (cap 110)
-- Vitality -1
-- Agility 3
-- HP Recovered While Healing 5
-- Ranged Accuracy % 8 (cap 20)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4430)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 1)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 110)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.FOOD_RACCP, 8)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 1)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 110)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.FOOD_RACCP, 8)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

return itemObject
