-----------------------------------
-- ID: 4458
-- Item: loaf_of_goblin_bread
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 7
-- Vitality 1
-- Charisma -5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4458)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 7)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.CHR, -5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 7)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.CHR, -5)
end

return itemObject
