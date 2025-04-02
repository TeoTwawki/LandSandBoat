-----------------------------------
-- ID: 6459
-- Item: bowl_of_soy_ramen_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP +55
-- STR +6
-- VIT +6
-- AGI +4
-- Attack +11% (cap 175)
-- Ranged Attack +11% (cap 175)
-- Resist Slow +15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6459)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 55)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.FOOD_ATTP, 11)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 175)
    target:addMod(invaderXim.mod.FOOD_RATTP, 11)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 175)
    target:addMod(invaderXim.mod.SLOWRES, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 55)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.FOOD_ATTP, 11)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 175)
    target:delMod(invaderXim.mod.FOOD_RATTP, 11)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 175)
    target:delMod(invaderXim.mod.SLOWRES, 15)
end

return itemObject
