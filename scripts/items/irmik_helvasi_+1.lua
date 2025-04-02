-----------------------------------
-- ID: 5573
-- Item: irmik_helvasi_+1
-- Food Effect: 4 hours, All Races
-----------------------------------
-- HP +10% (cap 100)
-- MP +3% (cap 15)
-- INT +2
-- hHP +1
-- hMP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5573)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 100)
    target:addMod(invaderXim.mod.FOOD_MPP, 3)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 15)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 100)
    target:delMod(invaderXim.mod.FOOD_MPP, 3)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 15)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
