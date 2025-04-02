-----------------------------------
-- ID: 4546
-- Item: piece_of_raisin_bread
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 20
-- Dexterity -1
-- Vitality 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4546)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.VIT, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.VIT, 4)
end

return itemObject
