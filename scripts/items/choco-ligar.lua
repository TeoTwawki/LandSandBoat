-----------------------------------
-- ID: 5919
-- Item: Choco-ligar
-- Food Effect: 3 Min, All Races
-----------------------------------
-- Vitality 1
-- Base speed 10% or +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5919)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.MOVE_SPEED_QUICKENING, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.MOVE_SPEED_QUICKENING, 5)
end

return itemObject
