-----------------------------------
-- ID: 5926
-- Item: Cup of Date Tea
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- HP 20
-- MP 30
-- Vitality -1
-- Charisma 5
-- Intelligence 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5926)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.FOOD_MP, 30)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.CHR, 5)
    target:addMod(invaderXim.mod.INT, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.FOOD_MP, 30)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.CHR, 5)
    target:delMod(invaderXim.mod.INT, 3)
end

return itemObject
