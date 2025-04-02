-----------------------------------
-- ID: 5927
-- Item: Cup of Caravan Tea
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- HP 22
-- MP 32
-- Charisma 6
-- Intelligence 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5927)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 22)
    target:addMod(invaderXim.mod.FOOD_MP, 32)
    target:addMod(invaderXim.mod.CHR, 6)
    target:addMod(invaderXim.mod.INT, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 22)
    target:delMod(invaderXim.mod.FOOD_MP, 32)
    target:delMod(invaderXim.mod.CHR, 6)
    target:delMod(invaderXim.mod.INT, 4)
end

return itemObject
