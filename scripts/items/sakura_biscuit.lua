-----------------------------------
-- ID: 6010
-- Item: Sakura Biscuit
-- Food Effect: 30Min, All Races
-----------------------------------
-- Intelligence 3
-- Charisma 2
-- Evasion +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6010)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.CHR, 2)
    target:addMod(invaderXim.mod.EVA, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.CHR, 2)
    target:delMod(invaderXim.mod.EVA, 2)
end

return itemObject
