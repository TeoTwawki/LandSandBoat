-----------------------------------
-- ID: 5650
-- Item: pair_of_nopales
-- Food Effect: 5min, All Races
-----------------------------------
-- VIT -4
-- AGI +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5650)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, -4)
    target:addMod(invaderXim.mod.AGI, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, -4)
    target:delMod(invaderXim.mod.AGI, 2)
end

return itemObject
