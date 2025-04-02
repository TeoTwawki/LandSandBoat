-----------------------------------
-- ID: 5976
-- Item: Bowl of Ulbuconut Milk
-- Food Effect: 3Min, All Races
-----------------------------------
-- Charisma +3
-- Vitality -2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5976)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CHR, 3)
    target:addMod(invaderXim.mod.VIT, -2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CHR, 3)
    target:delMod(invaderXim.mod.VIT, -2)
end

return itemObject
