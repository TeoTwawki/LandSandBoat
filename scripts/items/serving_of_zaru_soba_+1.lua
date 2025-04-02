-----------------------------------
-- ID: 5728
-- Item: serving_of_zaru_soba_+1
-- Food Effect: 60min, All Races
-----------------------------------
-- Agility 4
-- HP % 12 (cap 185)
-- Resist Sleep +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5728)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.FOOD_HPP, 12)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 185)
    target:addMod(invaderXim.mod.SLEEPRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.FOOD_HPP, 12)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 185)
    target:delMod(invaderXim.mod.SLEEPRES, 10)
end

return itemObject
