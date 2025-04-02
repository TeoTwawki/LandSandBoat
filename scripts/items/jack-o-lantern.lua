-----------------------------------
-- ID: 4488
-- Item: jack-o-lantern
-- Food Effect: 180Min, All Races
-----------------------------------
-- Charisma -10
-- Accuracy 10
-- Ranged Acc 10
-- Evasion 10
-- Arcana Killer 4
-- Dark Res 25
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4488)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CHR, -10)
    target:addMod(invaderXim.mod.ACC, 10)
    target:addMod(invaderXim.mod.RACC, 10)
    target:addMod(invaderXim.mod.EVA, 10)
    target:addMod(invaderXim.mod.ARCANA_KILLER, 4)
    target:addMod(invaderXim.mod.DARK_MEVA, 25)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CHR, -10)
    target:delMod(invaderXim.mod.ACC, 10)
    target:delMod(invaderXim.mod.RACC, 10)
    target:delMod(invaderXim.mod.EVA, 10)
    target:delMod(invaderXim.mod.ARCANA_KILLER, 4)
    target:delMod(invaderXim.mod.DARK_MEVA, 25)
end

return itemObject
