-----------------------------------
-- ID: 6275
-- Item: pukatrice_egg_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP +20
-- MP +20
-- STR +3
-- Fire resistance +21
-- Attack +21% (cap 90)
-- Ranged Attack +21% (cap 90)
-- Subtle Blow +9
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 6275)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.FIRE_MEVA, 21)
    target:addMod(invaderXim.mod.FOOD_ATTP, 21)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 90)
    target:addMod(invaderXim.mod.FOOD_RATTP, 21)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 90)
    target:addMod(invaderXim.mod.SUBTLE_BLOW, 9)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.FIRE_MEVA, 21)
    target:delMod(invaderXim.mod.FOOD_ATTP, 21)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 90)
    target:delMod(invaderXim.mod.FOOD_RATTP, 21)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 90)
    target:delMod(invaderXim.mod.SUBTLE_BLOW, 9)
end

return itemObject
