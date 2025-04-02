-----------------------------------
-- ID: 6009
-- Item: Bowl of Mog Pudding
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP 7
-- MP 7
-- Vitality 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6009)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 7)
    target:addMod(invaderXim.mod.FOOD_MP, 7)
    target:addMod(invaderXim.mod.VIT, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 7)
    target:delMod(invaderXim.mod.FOOD_MP, 7)
    target:delMod(invaderXim.mod.VIT, 3)
end

return itemObject
