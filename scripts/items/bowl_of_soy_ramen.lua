-----------------------------------
-- ID: 6458
-- Item: bowl_of_soy_ramen
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +50
-- STR +5
-- VIT +5
-- AGI +3
-- Attack +10% (cap 170)
-- Ranged Attack +10% (cap 170)
-- Resist Slow +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6458)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 50)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 10)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 170)
    target:addMod(invaderXim.mod.FOOD_RATTP, 10)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 170)
    target:addMod(invaderXim.mod.SLOWRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 50)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 10)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 170)
    target:delMod(invaderXim.mod.FOOD_RATTP, 10)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 170)
    target:delMod(invaderXim.mod.SLOWRES, 10)
end

return itemObject
