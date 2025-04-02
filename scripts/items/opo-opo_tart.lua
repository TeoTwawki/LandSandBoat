-----------------------------------
-- ID: 4287
-- Item: opo-opo_tart
-- Food Effect: 1hour, All Races
-----------------------------------
-- HP 12
-- MP 12
-- Intelligence 4
-- MP Recovered While Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4287)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 12)
    target:addMod(invaderXim.mod.FOOD_MP, 12)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 12)
    target:delMod(invaderXim.mod.FOOD_MP, 12)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
