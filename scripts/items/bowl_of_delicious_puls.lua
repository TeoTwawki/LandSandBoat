-----------------------------------
-- ID: 4533
-- Item: Bowl of Delicious Puls
-- Food Effect: 240Min, All Races
-----------------------------------
-- Dexterity -1
-- Vitality 3
-- Health Regen While Healing 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4533)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.HPHEAL, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.HPHEAL, 5)
end

return itemObject
