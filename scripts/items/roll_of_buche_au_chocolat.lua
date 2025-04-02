-----------------------------------
-- ID: 5550
-- Item: Roll of Buche Au Chocolat
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP +8
-- MP +3% Cap 13
-- Intelligence +2
-- HP Recovered while healing +1
-- MP Recovered while healing +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5550)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 3)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 13)
    target:addMod(invaderXim.mod.FOOD_HP, 8)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.MPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 3)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 13)
    target:delMod(invaderXim.mod.FOOD_HP, 8)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.MPHEAL, 4)
end

return itemObject
