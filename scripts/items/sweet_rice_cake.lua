-----------------------------------
-- ID: 4270
-- Item: sweet_rice_cake
-- Food Effect: 30Min, All Races
-----------------------------------
-- MP 17
-- Vitality 2
-- Intelligence 3
-- Mind 1
-- HP Recovered While Healing 2
-- MP Recovered While Healing 2
-- Evasion 5
-- Resist Silence 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4270)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 17)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.EVA, 5)
    target:addMod(invaderXim.mod.SILENCERES, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 17)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.EVA, 5)
    target:delMod(invaderXim.mod.SILENCERES, 4)
end

return itemObject
