-----------------------------------
-- ID: 6461
-- Item: bowl_of_miso_ramen_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP +105
-- STR +6
-- VIT +6
-- DEF +11% (cap 175)
-- Magic Evasion +11% (cap 55)
-- Magic Def. Bonus +6
-- Resist Slow +15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6461)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 105)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.FOOD_DEFP, 11)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 175)
    -- target:addMod(invaderXim.mod.FOOD_MEVAP, 11)
    -- target:addMod(invaderXim.mod.FOOD_MEVA_CAP, 55)
    target:addMod(invaderXim.mod.MDEF, 6)
    target:addMod(invaderXim.mod.SLOWRES, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 105)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.FOOD_DEFP, 11)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 175)
    -- target:delMod(invaderXim.mod.FOOD_MEVAP, 11)
    -- target:delMod(invaderXim.mod.FOOD_MEVA_CAP, 55)
    target:delMod(invaderXim.mod.MDEF, 6)
    target:delMod(invaderXim.mod.SLOWRES, 15)
end

return itemObject
