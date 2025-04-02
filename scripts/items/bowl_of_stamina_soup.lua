-----------------------------------
-- ID: 4337
-- Item: bowl_of_stamina_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP +12% (cap 200)
-- Dexterity 4
-- Vitality 6
-- Mind -3
-- HP Recovered While Healing 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4337)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 12)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 200)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.HPHEAL, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 12)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 200)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.HPHEAL, 10)
end

return itemObject
