-----------------------------------
-- ID: 6272
-- Item: fried_popoto
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +30
-- VIT +2
-- Fire resistance +20
-- DEF +20% (cap 145)
-- Subtle Blow +8
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6272)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.FIRE_MEVA, 20)
    target:addMod(invaderXim.mod.FOOD_DEFP, 20)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 145)
    target:addMod(invaderXim.mod.SUBTLE_BLOW, 8)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.FIRE_MEVA, 20)
    target:delMod(invaderXim.mod.FOOD_DEFP, 20)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 145)
    target:delMod(invaderXim.mod.SUBTLE_BLOW, 8)
end

return itemObject
