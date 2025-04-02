-----------------------------------
-- ID: 5757
-- Item: yellow_curry_bun
-- Food Effect: 30minutes, All Races
-----------------------------------
-- TODO: Group effects
-- Health Points 20
-- Strength 5
-- Agility 2
-- Intelligence -4
-- Attack 20% (caps @ 75)
-- Ranged Attack 20% (caps @ 75)
-- Resist Sleep +3
-- Resist Stun +4
-- hHP +2
-- hMP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5757)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.INT, -4)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:addMod(invaderXim.mod.FOOD_RATTP, 20)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 75)
    target:addMod(invaderXim.mod.SLEEPRES, 3)
    target:addMod(invaderXim.mod.STUNRES, 4)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.INT, -4)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 75)
    target:delMod(invaderXim.mod.FOOD_RATTP, 20)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 75)
    target:delMod(invaderXim.mod.SLEEPRES, 3)
    target:delMod(invaderXim.mod.STUNRES, 4)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
