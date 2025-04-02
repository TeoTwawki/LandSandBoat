-----------------------------------
-- ID: 5763
-- Item: yellow_curry_bun_+1
-- Food Effect: 60 min, All Races
-----------------------------------
-- TODO: Group effects
-- Health Points 30
-- Strength 5
-- Vitality 2
-- Agility 3
-- Intelligence -2
-- Attack 22% (caps @ 85)
-- Ranged Attack 22% (caps @ 85)
-- Resist Sleep +5
-- Resist Stun +6
-- hHP +6
-- hMP +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5763)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 30)
    target:addMod(invaderXim.mod.STR, 5)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.INT, -2)
    target:addMod(invaderXim.mod.FOOD_ATTP, 22)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 85)
    target:addMod(invaderXim.mod.FOOD_RATTP, 22)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 85)
    target:addMod(invaderXim.mod.SLEEPRES, 5)
    target:addMod(invaderXim.mod.STUNRES, 6)
    target:addMod(invaderXim.mod.HPHEAL, 6)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 30)
    target:delMod(invaderXim.mod.STR, 5)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.INT, -2)
    target:delMod(invaderXim.mod.FOOD_ATTP, 22)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 85)
    target:delMod(invaderXim.mod.FOOD_RATTP, 22)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 85)
    target:delMod(invaderXim.mod.SLEEPRES, 5)
    target:delMod(invaderXim.mod.STUNRES, 6)
    target:delMod(invaderXim.mod.HPHEAL, 6)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
