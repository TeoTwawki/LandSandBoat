-----------------------------------
-- ID: 5627
-- Item: Yogurt Cake
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- Intelligence 1
-- HP Recovered while healing 3
-- MP Recovered while healing 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5627)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.HPHEAL, 3)
    target:addMod(invaderXim.mod.MPHEAL, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.HPHEAL, 3)
    target:delMod(invaderXim.mod.MPHEAL, 6)
end

return itemObject
