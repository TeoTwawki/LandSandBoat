-----------------------------------
-- ID: 4539
-- Item: goblin_pie
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 12
-- Magic 12
-- Dexterity -1
-- Agility 3
-- Vitality -1
-- Charisma -5
-- Defense % 9 (cap 100)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4539)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 12)
    target:addMod(invaderXim.mod.FOOD_MP, 12)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.CHR, -5)
    target:addMod(invaderXim.mod.FOOD_DEFP, 9)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 100)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 12)
    target:delMod(invaderXim.mod.FOOD_MP, 12)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.CHR, -5)
    target:delMod(invaderXim.mod.FOOD_DEFP, 9)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 100)
end

return itemObject
