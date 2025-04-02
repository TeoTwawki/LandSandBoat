-----------------------------------
-- ID: 4418
-- Item: Turtle Soup
-- Food Effect: 3hours, All Races
-----------------------------------
-- HP + 10% (200 Cap)
-- Dexterity +4
-- Vitality +6
-- Mind -3
-- HP Recovered While Healing +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4418)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 10)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 200)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.HPHEAL, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 10)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 200)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.HPHEAL, 5)
end

return itemObject
