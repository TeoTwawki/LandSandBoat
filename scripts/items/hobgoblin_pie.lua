-----------------------------------
-- ID: 4325
-- Item: hobgoblin_pie
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 15
-- Magic 15
-- Agility 4
-- Charisma -7
-- Health Regen While Healing 2
-- Defense % 12 (cap 60)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4325)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 15)
    target:addMod(invaderXim.mod.FOOD_MP, 15)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.CHR, -7)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.FOOD_DEFP, 12)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 60)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 15)
    target:delMod(invaderXim.mod.FOOD_MP, 15)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.CHR, -7)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.FOOD_DEFP, 12)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 60)
end

return itemObject
