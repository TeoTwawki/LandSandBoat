-----------------------------------
-- ID: 4358
-- Hare Meat
-- 5 Minutes, food effect, Galka Only
-----------------------------------
-- Strength +1
-- Intelligence -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4358)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 1)
    target:addMod(invaderXim.mod.INT, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 1)
    target:delMod(invaderXim.mod.INT, -3)
end

return itemObject
