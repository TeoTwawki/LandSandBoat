-----------------------------------
-- ID: 5628
-- Item: Silken Smile
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- Intelligence 2
-- HP Recovered while healing 4
-- MP Recovered while healing 7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5628)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.HPHEAL, 4)
    target:addMod(invaderXim.mod.MPHEAL, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.HPHEAL, 4)
    target:delMod(invaderXim.mod.MPHEAL, 7)
end

return itemObject
