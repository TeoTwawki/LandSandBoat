-----------------------------------
-- ID: 5574
-- Item: dried_date_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 12
-- Magic 22
-- Agility -1
-- Intelligence 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5574)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 12)
    target:addMod(invaderXim.mod.FOOD_MP, 22)
    target:addMod(invaderXim.mod.AGI, -1)
    target:addMod(invaderXim.mod.INT, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 12)
    target:delMod(invaderXim.mod.FOOD_MP, 22)
    target:delMod(invaderXim.mod.AGI, -1)
    target:delMod(invaderXim.mod.INT, 4)
end

return itemObject
