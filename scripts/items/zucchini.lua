-----------------------------------
-- ID: 5726
-- Item: Zucchini
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility 1
-- Vitality -3
-- Defense -1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5726)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.VIT, -3)
    target:addMod(invaderXim.mod.DEF, -1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.VIT, -3)
    target:delMod(invaderXim.mod.DEF, -1)
end

return itemObject
