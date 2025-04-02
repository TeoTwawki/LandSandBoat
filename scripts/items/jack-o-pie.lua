-----------------------------------
-- ID: 5644
-- Item: jack-o-pie
-- Food Effect: 1hour, All Races
-----------------------------------
-- MP 45
-- CHR -1
-- Intelligence 4
-- hMP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5644)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 45)
    target:addMod(invaderXim.mod.CHR, -1)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 45)
    target:delMod(invaderXim.mod.CHR, -1)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
