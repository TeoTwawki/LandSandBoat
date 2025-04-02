-----------------------------------
-- ID: 5570
-- Item: cup_of_chai
-- Food Effect: 180Min, All Races
-----------------------------------
-- Vitality -2
-- Charisma 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5570)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, -2)
    target:addMod(invaderXim.mod.CHR, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, -2)
    target:delMod(invaderXim.mod.CHR, 2)
end

return itemObject
