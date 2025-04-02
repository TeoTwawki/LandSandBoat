-----------------------------------
-- ID: 6274
-- Item: pukatrice_egg
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +15
-- MP +15
-- STR +2
-- Fire resistance +20
-- Attack +20% (cap 85)
-- Ranged Attack +20% (cap 85)
-- Subtle Blow +8
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6274)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 15)
    target:addMod(invaderXim.mod.FOOD_MP, 15)
    target:addMod(invaderXim.mod.STR, 2)
    target:addMod(invaderXim.mod.FIRE_MEVA, 20)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 85)
    target:addMod(invaderXim.mod.SUBTLE_BLOW, 8)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 15)
    target:delMod(invaderXim.mod.FOOD_MP, 15)
    target:delMod(invaderXim.mod.STR, 2)
    target:delMod(invaderXim.mod.FIRE_MEVA, 20)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 85)
    target:delMod(invaderXim.mod.SUBTLE_BLOW, 8)
end

return itemObject
