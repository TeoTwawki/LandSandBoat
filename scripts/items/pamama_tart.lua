-----------------------------------
-- ID: 4563
-- Item: pamama_tart
-- Food Effect: 1hour, All Races
-----------------------------------
-- HP 10
-- MP 10
-- Dexterity -1
-- Intelligence 3
-- MP Recovered While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4563)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
