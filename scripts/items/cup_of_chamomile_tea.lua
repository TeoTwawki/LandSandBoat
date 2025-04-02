-----------------------------------
-- ID: 4603
-- Item: cup_of_chamomile_tea
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic 8
-- Vitality -2
-- Charisma 2
-- Magic Regen While Healing 1
-- Sleep resistance -30
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4603)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 8)
    target:addMod(invaderXim.mod.VIT, -2)
    target:addMod(invaderXim.mod.CHR, 2)
    target:addMod(invaderXim.mod.MPHEAL, 1)
    target:addMod(invaderXim.mod.SLEEPRES, -30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 8)
    target:delMod(invaderXim.mod.VIT, -2)
    target:delMod(invaderXim.mod.CHR, 2)
    target:delMod(invaderXim.mod.MPHEAL, 1)
    target:delMod(invaderXim.mod.SLEEPRES, -30)
end

return itemObject
