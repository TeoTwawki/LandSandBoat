-----------------------------------
-- ID: 6273
-- Item: fried_popoto_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP +35
-- VIT +3
-- Fire resistance +21
-- DEF +21% (cap 150)
-- Subtle Blow +9
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6273)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 35)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.FIRE_MEVA, 21)
    target:addMod(invaderXim.mod.FOOD_DEFP, 21)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 150)
    target:addMod(invaderXim.mod.SUBTLE_BLOW, 9)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 35)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.FIRE_MEVA, 21)
    target:delMod(invaderXim.mod.FOOD_DEFP, 21)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 150)
    target:delMod(invaderXim.mod.SUBTLE_BLOW, 9)
end

return itemObject
