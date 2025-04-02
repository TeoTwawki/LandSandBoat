-----------------------------------
-- ID: 5634
-- Item: Silken Spirit
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- MP +4% (cap 90)
-- HP Recovered while healing +2
-- MP Recovered while healing +7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5634)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 4)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 90)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 4)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 90)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 7)
end

return itemObject
