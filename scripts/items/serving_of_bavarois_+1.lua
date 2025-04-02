-----------------------------------
-- ID: 5730
-- Item: Serving of Bavarois +1
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- HP 25
-- Intelligence 4
-- hHP +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5730)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 25)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.HPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 25)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.HPHEAL, 4)
end

return itemObject
