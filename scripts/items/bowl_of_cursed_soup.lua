-----------------------------------
-- ID: 4235
-- Item: Bowl of Cursed Soup
-- Food Effect: 240Min, All Races
-----------------------------------
-- Strength -7
-- Dexterity -7
-- Agility -7
-- Vitality -7
-- Intelligence -7
-- Mind -7
-- Charisma -7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4235)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, -7)
    target:addMod(invaderXim.mod.DEX, -7)
    target:addMod(invaderXim.mod.AGI, -7)
    target:addMod(invaderXim.mod.VIT, -7)
    target:addMod(invaderXim.mod.INT, -7)
    target:addMod(invaderXim.mod.MND, -7)
    target:addMod(invaderXim.mod.CHR, -7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, -7)
    target:delMod(invaderXim.mod.DEX, -7)
    target:delMod(invaderXim.mod.AGI, -7)
    target:delMod(invaderXim.mod.VIT, -7)
    target:delMod(invaderXim.mod.INT, -7)
    target:delMod(invaderXim.mod.MND, -7)
    target:delMod(invaderXim.mod.CHR, -7)
end

return itemObject
