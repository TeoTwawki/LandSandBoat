-----------------------------------
-- ID: 4355
-- Item: salmon_sub_sandwich
-- Food Effect: 30Min, All Races
-----------------------------------
-- Dexterity 2
-- Agility 1
-- Vitality 1
-- Intelligence 2
-- Mind -2
-- Ranged ACC 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4355)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.INT, 2)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.RACC, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.INT, 2)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.RACC, 2)
end

return itemObject
