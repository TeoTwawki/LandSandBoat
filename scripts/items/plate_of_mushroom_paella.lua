-----------------------------------
-- ID: 5970
-- Item: Plate of Mushroom Paella
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- HP 40
-- Strength -1
-- Mind 5
-- Magic Accuracy 5
-- Undead Killer 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5970)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.STR, -1)
    target:addMod(invaderXim.mod.MND, 5)
    target:addMod(invaderXim.mod.MACC, 5)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.STR, -1)
    target:delMod(invaderXim.mod.MND, 5)
    target:delMod(invaderXim.mod.MACC, 5)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

return itemObject
