-----------------------------------
-- ID: 6498
-- Item: Bunch of Fortune Fruits
-- Food Effect: 30Min, All Races
-----------------------------------
-- Charisma +7
-- may have unknown hidden effects
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6498)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CHR, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CHR, 7)
end

return itemObject
