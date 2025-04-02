-----------------------------------
-- ID: 5617
-- Item: lebkuchen_manse
-- Food Effect: 240Min, All Races
-----------------------------------
-- HP +10
-- MP +10% (cap 55)
-- INT +4
-- hHP +3
-- hMP +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5617)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.FOOD_MPP, 10)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 55)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.HPHEAL, 3)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.FOOD_MPP, 10)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 55)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.HPHEAL, 3)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
