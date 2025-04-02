-----------------------------------
-- ID: 5456
-- Item: Istiridye
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity -5
-- Vitality 4
-- Defense +17.07%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5456)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -5)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.DEFP, 17.07)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -5)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.DEFP, 17.07)
end

return itemObject
