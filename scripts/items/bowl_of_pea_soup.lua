-----------------------------------
-- ID: 4416
-- Item: bowl_of_pea_soup
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- Vitality -1
-- Agility 1
-- Ranged Accuracy 5
-- HP Recovered While Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4416)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.RACC, 5)
    target:addMod(invaderXim.mod.HPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.RACC, 5)
    target:delMod(invaderXim.mod.HPHEAL, 3)
end

return itemObject
