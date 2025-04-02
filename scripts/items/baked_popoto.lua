-----------------------------------
-- ID: 4436
-- Item: Baked Popoto
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 20
-- Dexterity -1
-- Vitality 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4436)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.VIT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.VIT, 2)
end

return itemObject
