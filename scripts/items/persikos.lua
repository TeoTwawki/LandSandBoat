-----------------------------------
-- ID: 4274
-- Item: persikos
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility -7
-- Intelligence 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4274)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, -7)
    target:addMod(invaderXim.mod.INT, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, -7)
    target:delMod(invaderXim.mod.INT, 5)
end

return itemObject
