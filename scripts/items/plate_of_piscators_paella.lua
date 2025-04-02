-----------------------------------
-- ID: 5969
-- Item: Plate of Piscator's Paella
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- HP 45
-- Dexterity 6
-- Accuracy % 16 (cap 85)
-- Undead Killer 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5969)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 45)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.FOOD_ACCP, 16)
    target:addMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 45)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.FOOD_ACCP, 16)
    target:delMod(invaderXim.mod.FOOD_ACC_CAP, 85)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 6)
end

return itemObject
