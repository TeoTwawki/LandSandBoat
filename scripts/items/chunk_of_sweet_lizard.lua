-----------------------------------
-- ID: 5738
-- Item: chunk_of_sweet_lizard
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP 5
-- MP 5
-- Dexterity 1
-- hHP +2
-- hMP +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5738)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 5)
    target:addMod(invaderXim.mod.FOOD_MP, 5)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 5)
    target:delMod(invaderXim.mod.FOOD_MP, 5)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
