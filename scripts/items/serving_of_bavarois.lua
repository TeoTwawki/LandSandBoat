-----------------------------------
-- ID: 5729
-- Item: serving_of_bavarois
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- HP 20
-- Intelligence 3
-- hHP +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5729)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.HPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.HPHEAL, 3)
end

return itemObject
