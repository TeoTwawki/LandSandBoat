-----------------------------------
-- ID: 5622
-- Item: Candy Cane
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- Intelligence 4
-- Mind 4
-- MP Recovery while healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5622)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.MND, 4)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.MND, 4)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
