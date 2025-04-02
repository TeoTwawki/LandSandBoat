-----------------------------------
-- ID: 4271
-- Item: rice_dumpling
-- Food Effect: 30minutes, All Races
-----------------------------------
-- HP 17
-- Strength 3
-- Vitality 2
-- Agility 1
-- Attack 20% (caps @ 45)
-- Ranged Attack 30% (caps @ 45)
-- HP Regeneration While Healing 2
-- MP Regeneration While Healing 2
-- Accuracy 5
-- Resist Paralyze +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4271)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 17)
    target:addMod(invaderXim.mod.STR, 3)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.FOOD_ATTP, 20)
    target:addMod(invaderXim.mod.FOOD_ATT_CAP, 45)
    target:addMod(invaderXim.mod.FOOD_RATTP, 30)
    target:addMod(invaderXim.mod.FOOD_RATT_CAP, 45)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.ACC, 5)
    target:addMod(invaderXim.mod.PARALYZERES, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 17)
    target:delMod(invaderXim.mod.STR, 3)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.FOOD_ATTP, 20)
    target:delMod(invaderXim.mod.FOOD_ATT_CAP, 45)
    target:delMod(invaderXim.mod.FOOD_RATTP, 30)
    target:delMod(invaderXim.mod.FOOD_RATT_CAP, 45)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.ACC, 5)
    target:delMod(invaderXim.mod.PARALYZERES, 4)
end

return itemObject
