-----------------------------------
-- ID: 4550
-- Item: plate_of_bream_risotto
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 40
-- Dexterity 6
-- Agility 3
-- Mind -4
-- Health Regen While Healing 1
-- Ranged Accuracy % 6
-- Ranged Accuracy Cap 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4550)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.MND, -4)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.FOOD_RACCP, 6)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.MND, -4)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.FOOD_RACCP, 6)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 15)
end

return itemObject
