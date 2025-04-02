-----------------------------------
-- ID: 4522
-- Item: Bowl of Jack-o'-Soup
-- Food Effect: 240Min, All Races
-----------------------------------
-- Health % 2 (cap 120)
-- Agility 3
-- Vitality -1
-- Health Regen While Healing 5
-- Ranged ACC % 8
-- Ranged ACC Cap 25
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4522)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 2)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 120)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.FOOD_RACCP, 8)
    target:addMod(invaderXim.mod.FOOD_RACC_CAP, 25)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 2)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 120)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.FOOD_RACCP, 8)
    target:delMod(invaderXim.mod.FOOD_RACC_CAP, 25)
end

return itemObject
