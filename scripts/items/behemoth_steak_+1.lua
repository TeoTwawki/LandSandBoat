-----------------------------------
-- ID: 6465
-- Item: behemoth_steak_+1
-- Food Effect: 240Min, All Races
-----------------------------------
-- HP +45
-- STR +8
-- DEX +8
-- INT -4
-- Attack +24% (cap 165)
-- Ranged Attack +24% (cap 165)
-- Triple Attack +2%
-- Lizard Killer +5
-- hHP +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 6465)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 45)
    target:addMod(invaderXim.mod.STR, 8)
    target:addMod(invaderXim.mod.DEX, 8)
    target:addMod(invaderXim.mod.INT, -4)
    target:addMod(invaderXim.mod.FOOD_ATTP, 24)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 165)
    target:addMod(invaderXim.mod.FOOD_RATTP, 24)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 165)
    target:addMod(invaderXim.mod.TRIPLE_ATTACK, 2)
    target:addMod(invaderXim.mod.LIZARD_KILLER, 5)
    target:addMod(invaderXim.mod.HPHEAL, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 45)
    target:delMod(invaderXim.mod.STR, 8)
    target:delMod(invaderXim.mod.DEX, 8)
    target:delMod(invaderXim.mod.INT, -4)
    target:delMod(invaderXim.mod.FOOD_ATTP, 24)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 165)
    target:delMod(invaderXim.mod.FOOD_RATTP, 24)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 165)
    target:delMod(invaderXim.mod.TRIPLE_ATTACK, 2)
    target:delMod(invaderXim.mod.LIZARD_KILLER, 5)
    target:delMod(invaderXim.mod.HPHEAL, 5)
end

return itemObject
