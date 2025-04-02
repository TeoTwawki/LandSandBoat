-----------------------------------
-- ID: 4328
-- Item: loaf_of_hobgoblin_bread
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 10
-- Vitality 3
-- Charisma -7
-- Health Regen While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4328)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.CHR, -7)
    target:addMod(invaderXim.mod.HPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.CHR, -7)
    target:delMod(invaderXim.mod.HPHEAL, 2)
end

return itemObject
