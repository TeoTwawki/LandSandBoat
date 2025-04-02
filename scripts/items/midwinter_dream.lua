-----------------------------------
-- ID: 5543
-- Item: midwinter_dream
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP 10
-- MP 8% Cap 60
-- Intelligence 2
-- HP Recovered while healing 2
-- MP Recovered while healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5543)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.FOOD_MPP, 8)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 60)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.FOOD_MPP, 8)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 60)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
