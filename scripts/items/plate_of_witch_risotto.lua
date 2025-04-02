-----------------------------------
-- ID: 4330
-- Item: witch_risotto
-- Food Effect: 4hours, All Races
-----------------------------------
-- Magic Points 35
-- Strength -1
-- Vitality 3
-- Mind 3
-- MP Recovered While Healing 2
-- Enmity -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4330)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 35)
    target:addMod(invaderXim.mod.STR, -1)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.MND, 3)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.ENMITY, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 35)
    target:delMod(invaderXim.mod.STR, -1)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.MND, 3)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.ENMITY, -4)
end

return itemObject
