-----------------------------------
-- ID: 5579
-- Item: bowl_of_yayla_corbasi
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- HP 20
-- Dexterity -1
-- Vitality 2
-- HP Recovered While Healing 3
-- MP Recovered While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5579)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.HPHEAL, 3)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.HPHEAL, 3)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
