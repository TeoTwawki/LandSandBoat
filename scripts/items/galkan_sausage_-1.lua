-----------------------------------
-- ID: 5862
-- Item: galkan_sausage_-1
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength -3
-- Dexterity -3
-- Vitality -3
-- Agility -3
-- Mind -3
-- Intelligence -3
-- Charisma -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5862)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, -3)
    target:addMod(invaderXim.mod.DEX, -3)
    target:addMod(invaderXim.mod.VIT, -3)
    target:addMod(invaderXim.mod.AGI, -3)
    target:addMod(invaderXim.mod.MND, -3)
    target:addMod(invaderXim.mod.INT, -3)
    target:addMod(invaderXim.mod.CHR, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, -3)
    target:delMod(invaderXim.mod.DEX, -3)
    target:delMod(invaderXim.mod.VIT, -3)
    target:delMod(invaderXim.mod.AGI, -3)
    target:delMod(invaderXim.mod.MND, -3)
    target:delMod(invaderXim.mod.INT, -3)
    target:delMod(invaderXim.mod.CHR, -3)
end

return itemObject
