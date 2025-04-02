-----------------------------------
-- ID: 6212
-- Item: slice of marinara pizza +1
-- Food Effect: 60 minutes, all Races
-----------------------------------
-- HP +25
-- Accuracy+11% (Max. 58)
-- Attack+21% (Max. 55)
-- "Undead Killer"+5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6212)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 25)
    target:addMod(invaderXim.mod.FOOD_ACCP, 11)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 58)
    target:addMod(invaderXim.mod.FOOD_ATTP, 21)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 55)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 25)
    target:delMod(invaderXim.mod.FOOD_ACCP, 11)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 58)
    target:delMod(invaderXim.mod.FOOD_ATTP, 21)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 55)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

return itemObject
