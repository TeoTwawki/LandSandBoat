-----------------------------------
-- ID: 5594
-- Item: cup_of_chai_+1
-- Food Effect: 240Min, All Races
-----------------------------------
-- Vitality -3
-- Charisma 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5594)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, -3)
    target:addMod(invaderXim.mod.CHR, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, -3)
    target:delMod(invaderXim.mod.CHR, 3)
end

return itemObject
