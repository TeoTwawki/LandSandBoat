-----------------------------------
-- ID: 4323
-- Item: bowl_of_vegetable_broth
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- Vitality -1
-- Agility 5
-- Ranged Accuracy 6
-- HP Recovered While Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4323)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.RACC, 6)
    target:addMod(invaderXim.mod.HPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.RACC, 6)
    target:delMod(invaderXim.mod.HPHEAL, 3)
end

return itemObject
