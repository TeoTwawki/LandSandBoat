-----------------------------------
-- ID: 5718
-- Item: Cream Puff
-- Food Effect: 30 mintutes, All Races
-----------------------------------
-- Intelligence +7
-- HP -10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5718)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 7)
    target:addMod(invaderXim.mod.FOOD_HP, -10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 7)
    target:delMod(invaderXim.mod.FOOD_HP, -10)
end

return itemObject
