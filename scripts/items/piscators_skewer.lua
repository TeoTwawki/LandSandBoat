-----------------------------------
-- ID: 5983
-- Item: Piscator's Skewer
-- Food Effect: 60 Mins, All Races
-----------------------------------
-- Dexterity 3
-- Vitality 4
-- Defense % 26 Cap 155
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5983)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.FOOD_DEFP, 26)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 155)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.FOOD_DEFP, 26)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 155)
end

return itemObject
