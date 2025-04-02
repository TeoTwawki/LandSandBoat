-----------------------------------
-- ID: 5975
-- Item: Plate of Flapano's Paella
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- HP 45
-- Vitality 6
-- Defense % 26 Cap 155
-- Undead Killer 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5975)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 45)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.FOOD_DEFP, 26)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 155)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 45)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.FOOD_DEFP, 26)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 155)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 6)
end

return itemObject
