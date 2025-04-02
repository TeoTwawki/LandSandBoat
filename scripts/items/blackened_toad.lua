-----------------------------------
-- ID: 4599
-- Item: Blackened Toad
-- Food Effect: 180Min, All Races
-----------------------------------
-- Dexterity 2
-- Agility 2
-- Mind -1
-- Poison Resist 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4599)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.AGI, 2)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.POISONRES, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.AGI, 2)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.POISONRES, 4)
end

return itemObject
