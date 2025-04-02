-----------------------------------
-- ID: 4486
-- Item: Dragon Heart
-- Food Effect: 3 Hr, Galka Only
-----------------------------------
-- Strength 7
-- Intelligence -9
-- MP -40
-- HP 40
-- Dragon Killer 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4486)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, 7)
    target:addMod(invaderXim.mod.INT, -9)
    target:addMod(invaderXim.mod.FOOD_MP, -40)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.DRAGON_KILLER, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, 7)
    target:delMod(invaderXim.mod.INT, -9)
    target:delMod(invaderXim.mod.FOOD_MP, -40)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.DRAGON_KILLER, 10)
end

return itemObject
