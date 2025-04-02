-----------------------------------
-- ID: 5174
-- Item: tavnazian_taco
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 20
-- Magic 20
-- Dexterity 4
-- Agility 4
-- Vitality 6
-- Charisma 4
-- Defense % 25
-- HP Recovered While Healing 1
-- MP Recovered While Healing 1
-- Defense Cap 150
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5174)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.VIT, 6)
    target:addMod(invaderXim.mod.CHR, 4)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 150)
    target:addMod(invaderXim.mod.HPHEAL, 1)
    target:addMod(invaderXim.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.VIT, 6)
    target:delMod(invaderXim.mod.CHR, 4)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 150)
    target:delMod(invaderXim.mod.HPHEAL, 1)
    target:delMod(invaderXim.mod.MPHEAL, 1)
end

return itemObject
