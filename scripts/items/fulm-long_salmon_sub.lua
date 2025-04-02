-----------------------------------
-- ID: 4266
-- Item: fulm-long_salmon_sub
-- Food Effect: 60Min, All Races
-----------------------------------
-- DEX +2
-- VIT +1
-- AGI +1
-- INT +2
-- MND -2
-- Ranged Accuracy +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4266)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.RACC, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.RACC, 3)
end

return itemObject
