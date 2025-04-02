-----------------------------------
-- ID: 4595
-- Item: party_egg
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 25
-- Magic 25
-- Attack 5
-- Ranged Attack 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4595)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 25)
    target:addMod(invaderXim.mod.FOOD_MP, 25)
    target:addMod(invaderXim.mod.ATT, 5)
    target:addMod(invaderXim.mod.RATT, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 25)
    target:delMod(invaderXim.mod.FOOD_MP, 25)
    target:delMod(invaderXim.mod.ATT, 5)
    target:delMod(invaderXim.mod.RATT, 4)
end

return itemObject
