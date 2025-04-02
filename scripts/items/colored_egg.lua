-----------------------------------
-- ID: 4487
-- Item: colored_egg
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 20
-- Magic 20
-- Attack 3
-- Ranged Attack 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4487)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.ATT, 3)
    target:addMod(invaderXim.mod.RATT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.ATT, 3)
    target:delMod(invaderXim.mod.RATT, 2)
end

return itemObject
