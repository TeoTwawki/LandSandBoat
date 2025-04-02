-----------------------------------
-- ID: 5465
-- Item: Caedarva Frog
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity 2
-- Agility 2
-- Mind -4
-- Evasion 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5465)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.MND, -4)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.EVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.MND, -4)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.EVA, 5)
end

return itemObject
