-----------------------------------
-- ID: 6406
-- Item: pork_cutlet_rice_bowl
-- Food Effect: 180Min, All Races
-----------------------------------
-- HP +60
-- MP +60
-- STR +7
-- VIT +3
-- AGI +5
-- INT -7
-- Fire resistance +20
-- Attack +23% (cap 125)
-- Ranged Attack +23% (cap 125)
-- Store TP +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 6406)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 60)
    target:addMod(invaderXim.mod.FOOD_MP, 60)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.INT, -7)
    target:addMod(invaderXim.mod.FIRE_MEVA, 20)
    target:addMod(invaderXim.mod.FOOD_ATTP, 23)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 125)
    target:addMod(invaderXim.mod.FOOD_RATTP, 23)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 125)
    target:addMod(invaderXim.mod.STORETP, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 60)
    target:delMod(invaderXim.mod.FOOD_MP, 60)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.INT, -7)
    target:delMod(invaderXim.mod.FIRE_MEVA, 20)
    target:delMod(invaderXim.mod.FOOD_ATTP, 23)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 125)
    target:delMod(invaderXim.mod.FOOD_RATTP, 23)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 125)
    target:delMod(invaderXim.mod.STORETP, 4)
end

return itemObject
