-----------------------------------
-- ID: 5587
-- Item: serving_of_menemen_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP 35
-- MP 35
-- Agility 2
-- Intelligence -2
-- HP recovered while healing 2
-- MP recovered while healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5587)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 35)
    target:addMod(invaderXim.mod.FOOD_MP, 35)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 35)
    target:delMod(invaderXim.mod.FOOD_MP, 35)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
