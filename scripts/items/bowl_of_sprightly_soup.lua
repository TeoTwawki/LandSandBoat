-----------------------------------
-- ID: 5930
-- Item: Bowl of Sprightly Soup
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- MP 30
-- Mind 4
-- HP Recovered While Healing 4
-- Enmity -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5930)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 30)
    target:addMod(invaderXim.mod.MND, 4)
    target:addMod(invaderXim.mod.HPHEAL, 4)
    target:addMod(invaderXim.mod.ENMITY, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 30)
    target:delMod(invaderXim.mod.MND, 4)
    target:delMod(invaderXim.mod.HPHEAL, 4)
    target:delMod(invaderXim.mod.ENMITY, -4)
end

return itemObject
