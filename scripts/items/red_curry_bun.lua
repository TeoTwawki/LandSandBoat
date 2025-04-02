-----------------------------------
-- ID: 5759
-- Item: red_curry_bun
-- Food Effect: 30 Min, All Races
-----------------------------------
-- TODO: Group effects
-- Health 25
-- Strength 7
-- Agility 1
-- Intelligence -2
-- Attack % 23 (cap 150)
-- Ranged Atk % 23 (cap 150)
-- Demon Killer 4
-- Resist Sleep +3
-- HP recovered when healing +2
-- MP recovered when healing +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5759)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 25)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 23)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:addMod(invaderXim.mod.FOOD_RATTP, 23)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:addMod(invaderXim.mod.DEMON_KILLER, 4)
    target:addMod(invaderXim.mod.SLEEPRES, 3)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 25)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 23)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:delMod(invaderXim.mod.FOOD_RATTP, 23)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:delMod(invaderXim.mod.DEMON_KILLER, 4)
    target:delMod(invaderXim.mod.SLEEPRES, 3)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
