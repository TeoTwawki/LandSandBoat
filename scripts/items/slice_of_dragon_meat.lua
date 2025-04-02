-----------------------------------
-- ID: 4272
-- Item: slice_of_dragon_meat
-- Food Effect: 5Min, Galka only
-----------------------------------
-- Strength 6
-- Intelligence -8
-- Demon Killer +2 (?)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4272)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.INT, -8)
    target:addMod(invaderXim.mod.DEMON_KILLER, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.INT, -8)
    target:delMod(invaderXim.mod.DEMON_KILLER, 2)
end

return itemObject
