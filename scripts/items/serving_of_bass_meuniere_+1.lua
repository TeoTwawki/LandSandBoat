-----------------------------------
-- ID: 4346
-- Item: serving_of_bass_meuniere_+1
-- Food Effect: 240Min, All Races
-----------------------------------
-- Health % 3 (cap 130)
-- Dexterity 3
-- Agility 3
-- Mind -3
-- Ranged ACC % 6
-- Ranged ACC Cap 20
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4346)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 3)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 130)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.FOOD_RACCP, 6)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 3)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 130)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.FOOD_RACCP, 6)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 20)
end

return itemObject
