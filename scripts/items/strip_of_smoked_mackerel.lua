-----------------------------------
-- ID: 5943
-- Item: Strip of Smoked Mackerel
-- Food Effect: 30Min, All Races
-----------------------------------
-- Agility 4
-- Vitality -3
-- Evasion +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5943)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.VIT, -3)
    target:addMod(invaderXim.mod.EVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.VIT, -3)
    target:delMod(invaderXim.mod.EVA, 5)
end

return itemObject
