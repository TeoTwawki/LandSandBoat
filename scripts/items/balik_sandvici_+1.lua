-----------------------------------
-- ID: 5591
-- Item: Balik Sandvic +1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 3
-- Agility 1
-- Intelligence 3
-- Mind -2
-- Ranged ACC 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5591)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.RACC, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.RACC, 6)
end

return itemObject
