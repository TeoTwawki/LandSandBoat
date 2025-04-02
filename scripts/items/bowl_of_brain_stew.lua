-----------------------------------
-- ID: 4542
-- Item: Bowl of Brain Stew
-- Food Effect: 180Min, All Races
-----------------------------------
-- Dexterity 5
-- Intelligence 5
-- Mind 5
-- Health Regen While Healing 3
-- Magic Regen While Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4542)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 5)
    target:addMod(invaderXim.mod.INT, 5)
    target:addMod(invaderXim.mod.MND, 5)
    target:addMod(invaderXim.mod.HPHEAL, 3)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 5)
    target:delMod(invaderXim.mod.INT, 5)
    target:delMod(invaderXim.mod.MND, 5)
    target:delMod(invaderXim.mod.HPHEAL, 3)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
