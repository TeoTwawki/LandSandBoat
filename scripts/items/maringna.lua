-----------------------------------
-- ID: 5888
-- Item: maringna
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +9% (cap 160)
-- Increases rate of combat skill gains by 80%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5888)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 9)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 160)
    target:addMod(invaderXim.mod.COMBAT_SKILLUP_RATE, 80)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 9)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 160)
    target:delMod(invaderXim.mod.COMBAT_SKILLUP_RATE, 80)
end

return itemObject
