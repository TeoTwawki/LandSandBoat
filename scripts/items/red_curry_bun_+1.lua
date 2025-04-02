-----------------------------------
-- ID: 5765
-- Item: red_curry_bun_+1
-- Food Effect: 60 Min, All Races
-----------------------------------
-- TODO: Group effects
-- Health 35
-- Strength 7
-- Agility 3
-- Attack % 25 (cap 150)
-- Ranged Atk % 25 (cap 150)
-- Demon Killer 6
-- Resist Sleep +5
-- HP recovered when healing +6
-- MP recovered when healing +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5765)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 35)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.FOOD_ATTP, 25)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:addMod(invaderXim.mod.FOOD_RATTP, 25)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:addMod(invaderXim.mod.DEMON_KILLER, 6)
    target:addMod(invaderXim.mod.SLEEPRES, 5)
    target:addMod(invaderXim.mod.HPHEAL, 6)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 35)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.FOOD_ATTP, 25)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 150)
    target:delMod(invaderXim.mod.FOOD_RATTP, 25)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 150)
    target:delMod(invaderXim.mod.DEMON_KILLER, 6)
    target:delMod(invaderXim.mod.SLEEPRES, 5)
    target:delMod(invaderXim.mod.HPHEAL, 6)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
