-----------------------------------
-- ID: 4327
-- Item: Bowl of Emerald Soup
-- Food Effect: 240Min, All Races
-----------------------------------
-- Agility 2
-- Vitality -1
-- Health Regen While Healing 3
-- Ranged ACC 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4327)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.HPHEAL, 3)
    target:addMod(invaderXim.mod.RACC, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.HPHEAL, 3)
    target:delMod(invaderXim.mod.RACC, 6)
end

return itemObject
