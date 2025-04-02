-----------------------------------
-- ID: 5580
-- Item: bowl_of_yayla_corbasi_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP 25
-- Dexterity -1
-- Vitality 3
-- HP Recovered While Healing 5
-- MP Recovered While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5580)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 25)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 25)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
