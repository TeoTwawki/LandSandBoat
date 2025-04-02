-----------------------------------
-- ID: 4333
-- Item: witch_soup
-- Food Effect: 4hours, All Races
-----------------------------------
-- Magic Points 25
-- Strength -1
-- Mind 2
-- MP Recovered While Healing 1
-- Enmity -2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4333)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 25)
    target:addMod(invaderXim.mod.STR, -1)
    target:addMod(invaderXim.mod.MND, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
    target:addMod(invaderXim.mod.ENMITY, -2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 25)
    target:delMod(invaderXim.mod.STR, -1)
    target:delMod(invaderXim.mod.MND, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
    target:delMod(invaderXim.mod.ENMITY, -2)
end

return itemObject
