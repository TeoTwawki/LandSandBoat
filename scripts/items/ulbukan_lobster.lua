-----------------------------------
-- ID: 5960
-- Item: Ulbukan Lobster
-- Food Effect: 5 Min, Mithra only
-----------------------------------
-- Dexterity -3
-- Vitality 1
-- Defense +9%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5960)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -3)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.DEFP, 9)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -3)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.DEFP, 9)
end

return itemObject
