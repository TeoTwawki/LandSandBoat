-----------------------------------
-- ID: 4598
-- Item: wild_pineapple
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility -5
-- Intelligence 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4598)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, -5)
    target:addMod(invaderXim.mod.INT, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, -5)
    target:delMod(invaderXim.mod.INT, 3)
end

return itemObject
