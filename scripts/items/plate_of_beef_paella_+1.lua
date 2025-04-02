-----------------------------------
-- ID: 5973
-- Item: Plate of Beef Paella +1
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- HP 45
-- Strength 6
-- Attack % 19 Cap 95
-- Undead Killer 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5973)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 45)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.FOOD_ATTP, 19)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 95)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 45)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.FOOD_ATTP, 19)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 95)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 6)
end

return itemObject
