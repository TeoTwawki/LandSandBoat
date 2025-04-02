-----------------------------------
-- ID: 5161
-- Item: serving_of_leadafry
-- Food Effect: 240Min, All Races
-----------------------------------
-- Agility 5
-- Vitality 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5161)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.VIT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.VIT, 2)
end

return itemObject
