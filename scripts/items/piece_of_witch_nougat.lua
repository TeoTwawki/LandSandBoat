-----------------------------------
-- ID: 5645
-- Item: piece_of_witch_nougat
-- Food Effect: 1hour, All Races
-----------------------------------
-- HP 50
-- Intelligence 3
-- Agility -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5645)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 50)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.AGI, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 50)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.AGI, -3)
end

return itemObject
