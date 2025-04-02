-----------------------------------
-- ID: 5158
-- Item: Vermillion Jelly
-- Food Effect: 4 hours, All Races
-----------------------------------
-- MP +12%(Cap: 90@750 Base MP)
-- Intelligence +6
-- MP Recovered While Healing +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5158)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MPP, 12)
    target:addMod(invaderXim.mod.FOOD_MP_CAP, 90)
    target:addMod(invaderXim.mod.INT, 6)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MPP, 12)
    target:delMod(invaderXim.mod.FOOD_MP_CAP, 90)
    target:delMod(invaderXim.mod.INT, 6)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
