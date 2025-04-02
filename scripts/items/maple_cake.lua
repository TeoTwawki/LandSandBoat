-----------------------------------
-- ID: 5625
-- Item: Maple Cake
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP Recoverd while healing 1
-- MP Recovered while healing 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5625)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.MPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.MPHEAL, 4)
end

return itemObject
