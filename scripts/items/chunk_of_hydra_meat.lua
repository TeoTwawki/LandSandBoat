-----------------------------------
-- ID: 5564
-- Item: Chunk of Hydra Meat
-- Effect: 5 Minutes, food effect, Galka Only
-----------------------------------
-- HP 10
-- MP -10
-- Strength +6
-- Intelligence -8
-- Demon Killer 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5564)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.FOOD_MP, -10)
    target:addMod(invaderXim.mod.STR, 6)
    target:addMod(invaderXim.mod.INT, -8)
    target:addMod(invaderXim.mod.DEMON_KILLER, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.FOOD_MP, -10)
    target:delMod(invaderXim.mod.STR, 6)
    target:delMod(invaderXim.mod.INT, -8)
    target:delMod(invaderXim.mod.DEMON_KILLER, 10)
end

return itemObject
