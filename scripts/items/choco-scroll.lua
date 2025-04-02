-----------------------------------
-- ID: 5917
-- Item: Choco-scroll
-- Food Effect: 3 Min, All Races
-----------------------------------
-- Mind 1
-- Base speed 10% or +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5917)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.MOVE_SPEED_QUICKENING, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.MOVE_SPEED_QUICKENING, 5)
end

return itemObject
