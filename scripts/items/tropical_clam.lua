-----------------------------------
-- ID: 5124
-- Item: Tropical Clam
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Vitality 4
-- Dexterity -5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5124)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.DEX, -5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.DEX, -5)
end

return itemObject
