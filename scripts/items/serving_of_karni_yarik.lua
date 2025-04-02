-----------------------------------
-- ID: 5588
-- Item: serving_of_karni_yarik
-- Food Effect: 30Min, All Races
-----------------------------------
-- Agility 3
-- Vitality -1
-- Attack % 20 (cap 65)
-- Ranged Attack % 20 (cap 65)
-- Evasion +6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5588)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 65)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 65)
    target:addMod(invaderXim.mod.EVA, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 65)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 65)
    target:delMod(invaderXim.mod.EVA, 6)
end

return itemObject
