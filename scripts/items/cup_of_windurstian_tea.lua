-----------------------------------
-- ID: 4493
-- Item: cup_of_windurstian_tea
-- Food Effect: 180Min, All Races
-----------------------------------
-- Vitality -2
-- Charisma 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4493)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, -2)
    target:addMod(invaderXim.mod.CHR, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, -2)
    target:delMod(invaderXim.mod.CHR, 1)
end

return itemObject
