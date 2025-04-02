-----------------------------------
-- ID: 5907
-- Item: Winterflower
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility +3
-- Intelligence +5
-- Charisma -5
-- Resist Virus +20
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5907)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 3)
    target:addMod(invaderXim.mod.INT, 5)
    target:addMod(invaderXim.mod.CHR, -5)
    target:addMod(invaderXim.mod.VIRUSRES, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 3)
    target:delMod(invaderXim.mod.INT, 5)
    target:delMod(invaderXim.mod.CHR, -5)
    target:delMod(invaderXim.mod.VIRUSRES, 20)
end

return itemObject
