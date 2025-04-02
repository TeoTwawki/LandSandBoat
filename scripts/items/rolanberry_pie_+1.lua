-----------------------------------
-- ID: 4339
-- Item: rolanberry_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Magic 60
-- Intelligence 3
-- MP Regen While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4339)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 60)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 60)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
