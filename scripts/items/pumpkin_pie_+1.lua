-----------------------------------
-- ID: 4525
-- Item: pumpkin_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Magic 45
-- Intelligence 4
-- Charisma -1
-- MP Recovered While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4525)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 45)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.CHR, -1)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 45)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.CHR, -1)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
