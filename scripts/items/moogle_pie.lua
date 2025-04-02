-----------------------------------
-- ID: 5561
-- Item: Moogle Pie
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- HP 20
-- MP 20
-- Strength 1
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- Intelligence 1
-- Mind 1
-- Charisma 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5561)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.FOOD_MP, 20)
    target:addMod(invaderXim.mod.STR, 1)
    target:addMod(invaderXim.mod.DEX, 1)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.AGI, 1)
    target:addMod(invaderXim.mod.INT, 1)
    target:addMod(invaderXim.mod.MND, 1)
    target:addMod(invaderXim.mod.CHR, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.FOOD_MP, 20)
    target:delMod(invaderXim.mod.STR, 1)
    target:delMod(invaderXim.mod.DEX, 1)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.AGI, 1)
    target:delMod(invaderXim.mod.INT, 1)
    target:delMod(invaderXim.mod.MND, 1)
    target:delMod(invaderXim.mod.CHR, 1)
end

return itemObject
