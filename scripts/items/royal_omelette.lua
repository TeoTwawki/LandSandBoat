-----------------------------------
-- ID: 4564
-- Item: royal_omelette
-- Food Effect: 180Min, All Races
-----------------------------------
-- Strength 5
-- Dexterity 2
-- Intelligence -3
-- Mind 4
-- Attack % 20 (cap 65)
-- Ranged Attack % 20 (cap 65)
-----------------------------------
-- IF ELVAAN ONLY
-- HP 20
-- MP 20
-- Strength 6
-- Dexterity 2
-- Intelligence -2
-- Mind 5
-- Charisma 4
-- Attack % 22
-- Attack Cap 80
-- Ranged ATT % 22
-- Ranged ATT Cap 80
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4564)
end

itemObject.onEffectGain = function(target, effect)
    if
        target:getRace() == invaderXim.race.ELVAAN_M or
        target:getRace() == invaderXim.race.ELVAAN_F
    then
        target:addMod(invaderXim.mod.FOOD_HP, 20)
        target:addMod(invaderXim.mod.FOOD_MP, 20)
        target:addMod(invaderXim.mod.STR, 6)
        target:addMod(invaderXim.mod.DEX, 2)
        target:addMod(invaderXim.mod.INT, -2)
        target:addMod(invaderXim.mod.MND, 5)
        target:addMod(invaderXim.mod.CHR, 4)
        target:addMod(invaderXim.mod.FOOD_ATTP, 22)
        target:addMod(invaderXim.mod.FOOD_ATT_CAP, 80)
        target:addMod(invaderXim.mod.FOOD_RATTP, 22)
        target:addMod(invaderXim.mod.FOOD_RATT_CAP, 80)
    else
        target:addMod(invaderXim.mod.STR, 5)
        target:addMod(invaderXim.mod.DEX, 2)
        target:addMod(invaderXim.mod.INT, -3)
        target:addMod(invaderXim.mod.MND, 4)
        target:addMod(invaderXim.mod.FOOD_ATTP, 20)
        target:addMod(invaderXim.mod.FOOD_ATT_CAP, 65)
        target:addMod(invaderXim.mod.FOOD_RATTP, 20)
        target:addMod(invaderXim.mod.FOOD_RATT_CAP, 65)
    end
end

itemObject.onEffectLose = function(target, effect)
    if
        target:getRace() == invaderXim.race.ELVAAN_M or
        target:getRace() == invaderXim.race.ELVAAN_F
    then
        target:delMod(invaderXim.mod.FOOD_HP, 20)
        target:delMod(invaderXim.mod.FOOD_MP, 20)
        target:delMod(invaderXim.mod.STR, 6)
        target:delMod(invaderXim.mod.DEX, 2)
        target:delMod(invaderXim.mod.INT, -2)
        target:delMod(invaderXim.mod.MND, 5)
        target:delMod(invaderXim.mod.CHR, 4)
        target:delMod(invaderXim.mod.FOOD_ATTP, 22)
        target:delMod(invaderXim.mod.FOOD_ATT_CAP, 80)
        target:delMod(invaderXim.mod.FOOD_RATTP, 22)
        target:delMod(invaderXim.mod.FOOD_RATT_CAP, 80)
    else
        target:delMod(invaderXim.mod.STR, 5)
        target:delMod(invaderXim.mod.DEX, 2)
        target:delMod(invaderXim.mod.INT, -3)
        target:delMod(invaderXim.mod.MND, 4)
        target:delMod(invaderXim.mod.FOOD_ATTP, 20)
        target:delMod(invaderXim.mod.FOOD_ATT_CAP, 65)
        target:delMod(invaderXim.mod.FOOD_RATTP, 20)
        target:delMod(invaderXim.mod.FOOD_RATT_CAP, 65)
    end
end

return itemObject
