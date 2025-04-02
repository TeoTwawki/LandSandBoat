
-----------------------------------
-- ID: 4331
-- Item: imperial_omelette
-- Food Effect: 240Min, All Races
-----------------------------------
-- Non Elvaan Stats
-- Strength 5
-- Dexterity 2
-- Intelligence -3
-- Mind 4
-- Attack % 22
-- Attack Cap 70
-- Ranged ATT % 22
-- Ranged ATT Cap 70
-----------------------------------
-- Elvaan Stats
-- Strength 7
-- Health 30
-- Magic 30
-- Intelligence -1
-- Mind 6
-- Charisma 5
-- Attack % 20 (cap 80)
-- Ranged ATT % 20 (cap 80)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4331)
end

itemObject.onEffectGain = function(target, effect)
    if
        target:getRace() == invaderXim.race.ELVAAN_M or
        target:getRace() == invaderXim.race.ELVAAN_F
    then
        target:addMod(invaderXim.mod.STR, 5)
        target:addMod(invaderXim.mod.DEX, 2)
        target:addMod(invaderXim.mod.INT, -3)
        target:addMod(invaderXim.mod.MND, 4)
        target:addMod(invaderXim.mod.FOOD_ATTP, 22)
        target:addMod(invaderXim.mod.FOOD_ATT_CAP, 70)
        target:addMod(invaderXim.mod.FOOD_RATTP, 22)
        target:addMod(invaderXim.mod.FOOD_RATT_CAP, 70)
    else
        target:addMod(invaderXim.mod.FOOD_HP, 30)
        target:addMod(invaderXim.mod.FOOD_MP, 30)
        target:addMod(invaderXim.mod.STR, 7)
        target:addMod(invaderXim.mod.DEX, 3)
        target:addMod(invaderXim.mod.INT, -1)
        target:addMod(invaderXim.mod.MND, 6)
        target:addMod(invaderXim.mod.CHR, 5)
        target:addMod(invaderXim.mod.FOOD_ATTP, 20)
        target:addMod(invaderXim.mod.FOOD_ATT_CAP, 80)
        target:addMod(invaderXim.mod.FOOD_RATTP, 20)
        target:addMod(invaderXim.mod.FOOD_RATT_CAP, 80)
    end
end

itemObject.onEffectLose = function(target, effect)
    if
        target:getRace() == invaderXim.race.ELVAAN_M or
        target:getRace() == invaderXim.race.ELVAAN_F
    then
        target:delMod(invaderXim.mod.STR, 5)
        target:delMod(invaderXim.mod.DEX, 2)
        target:delMod(invaderXim.mod.INT, -3)
        target:delMod(invaderXim.mod.MND, 4)
        target:delMod(invaderXim.mod.FOOD_ATTP, 22)
        target:delMod(invaderXim.mod.FOOD_ATT_CAP, 70)
        target:delMod(invaderXim.mod.FOOD_RATTP, 22)
        target:delMod(invaderXim.mod.FOOD_RATT_CAP, 70)
    else
        target:delMod(invaderXim.mod.FOOD_HP, 30)
        target:delMod(invaderXim.mod.FOOD_MP, 30)
        target:delMod(invaderXim.mod.STR, 7)
        target:delMod(invaderXim.mod.DEX, 3)
        target:delMod(invaderXim.mod.INT, -1)
        target:delMod(invaderXim.mod.MND, 6)
        target:delMod(invaderXim.mod.CHR, 5)
        target:delMod(invaderXim.mod.FOOD_ATTP, 20)
        target:delMod(invaderXim.mod.FOOD_ATT_CAP, 80)
        target:delMod(invaderXim.mod.FOOD_RATTP, 20)
        target:delMod(invaderXim.mod.FOOD_RATT_CAP, 80)
    end
end

return itemObject
