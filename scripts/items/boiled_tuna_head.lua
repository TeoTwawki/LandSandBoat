-----------------------------------
-- ID: 4540
-- Item: Boiled Tuna Head
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic 20
-- Dexterity 3
-- Intelligence 4
-- Mind -3
-- Magic Regen While Healing 2
-- Evasion 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4540)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.EVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.EVA, 5)
end

return itemObject
