-----------------------------------
-- ID: 5931
-- Item: Bowl of Shimmy Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- MP 32
-- Mind 5
-- HP Recovered While Healing 5
-- Enmity -5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5931)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 32)
    target:addMod(invaderXim.mod.MND, 5)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.ENMITY, -5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 32)
    target:delMod(invaderXim.mod.MND, 5)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.ENMITY, -5)
end

return itemObject
