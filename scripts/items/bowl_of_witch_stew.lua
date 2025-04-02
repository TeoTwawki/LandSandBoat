-----------------------------------
-- ID: 4344
-- Item: witch_stew
-- Food Effect: 4hours, All Races
-----------------------------------
-- Magic Points 45
-- Strength -1
-- Mind 4
-- MP Recovered While Healing 4
-- Enmity -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4344)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 45)
    target:addMod(invaderXim.mod.STR, -1)
    target:addMod(invaderXim.mod.MND, 4)
    target:addMod(invaderXim.mod.MPHEAL, 4)
    target:addMod(invaderXim.mod.ENMITY, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 45)
    target:delMod(invaderXim.mod.STR, -1)
    target:delMod(invaderXim.mod.MND, 4)
    target:delMod(invaderXim.mod.MPHEAL, 4)
    target:delMod(invaderXim.mod.ENMITY, -4)
end

return itemObject
