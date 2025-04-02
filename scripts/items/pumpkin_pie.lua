-----------------------------------
-- ID: 4446
-- Item: pumpkin_pie
-- Food Effect: 30Min, All Races
-----------------------------------
-- Magic 40
-- Agility -1
-- Intelligence 3
-- Charisma -2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4446)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 40)
    target:addMod(invaderXim.mod.AGI, -1)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.CHR, -2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 40)
    target:delMod(invaderXim.mod.AGI, -1)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.CHR, -2)
end

return itemObject
