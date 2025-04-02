-----------------------------------
-- ID: 5143
-- Item: serving_of_goblin_stir-fry
-- Food Effect: 180Min, All Races
-----------------------------------
-- Agility 5
-- Vitality 2
-- Charisma -5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5143)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.CHR, -5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.CHR, -5)
end

return itemObject
