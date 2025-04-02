-----------------------------------
-- ID: 6460
-- Item: bowl_of_miso_ramen
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +100
-- STR +5
-- VIT +5
-- DEF +10% (cap 170)
-- Magic Evasion +10% (cap 50)
-- Magic Def. Bonus +5
-- Resist Slow +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6460)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 100)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.FOOD_DEFP, 10)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 170)
    -- target:addMod(invaderXim.mod.FOOD_MEVAP, 10)
    -- target:addMod(invaderXim.mod.FOOD_MEVA_CAP, 50)
    target:addMod(invaderXim.mod.MDEF, 5)
    target:addMod(invaderXim.mod.SLOWRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 100)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.FOOD_DEFP, 10)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 170)
    -- target:delMod(invaderXim.mod.FOOD_MEVAP, 10)
    -- target:delMod(invaderXim.mod.FOOD_MEVA_CAP, 50)
    target:delMod(invaderXim.mod.MDEF, 5)
    target:delMod(invaderXim.mod.SLOWRES, 10)
end

return itemObject
