-----------------------------------
-- ID: 5746
-- Item: serving_of_cherry_bavarois_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP 30
-- Intelligence 4
-- MP 15
-- HP Recovered While Healing 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5746)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.FOOD_MP, 15)
    target:addMod(invaderXim.mod.HPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.FOOD_MP, 15)
    target:delMod(invaderXim.mod.HPHEAL, 4)
end

return itemObject
