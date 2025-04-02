-----------------------------------
-- ID: 6464
-- Item: behemoth_steak
-- Food Effect: 180Min, All Races
-----------------------------------
-- HP +40
-- STR +7
-- DEX +7
-- INT -3
-- Attack +23% (cap 160)
-- Ranged Attack +23% (cap 160)
-- Triple Attack +1%
-- Lizard Killer +4
-- hHP +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 6464)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.DEX, 7)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 23)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 160)
    target:addMod(invaderXim.mod.FOOD_RATTP, 23)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 160)
    target:addMod(invaderXim.mod.TRIPLE_ATTACK, 1)
    target:addMod(invaderXim.mod.LIZARD_KILLER, 4)
    target:addMod(invaderXim.mod.HPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.DEX, 7)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 23)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 160)
    target:delMod(invaderXim.mod.FOOD_RATTP, 23)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 160)
    target:delMod(invaderXim.mod.TRIPLE_ATTACK, 1)
    target:delMod(invaderXim.mod.LIZARD_KILLER, 4)
    target:delMod(invaderXim.mod.HPHEAL, 4)
end

return itemObject
