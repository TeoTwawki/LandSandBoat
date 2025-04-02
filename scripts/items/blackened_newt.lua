-----------------------------------
-- ID: 4581
-- Item: Blackened Newt
-- Food Effect: 180Min, All Races
-----------------------------------
-- Dexterity 4
-- Mind -3
-- Attack % 18
-- Attack Cap 60
-- Virus Resist 4
-- Curse Resist 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4581)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 18)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:addMod(invaderXim.mod.VIRUSRES, 4)
    target:addMod(invaderXim.mod.CURSERES, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 18)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 60)
    target:delMod(invaderXim.mod.VIRUSRES, 4)
    target:delMod(invaderXim.mod.CURSERES, 4)
end

return itemObject
