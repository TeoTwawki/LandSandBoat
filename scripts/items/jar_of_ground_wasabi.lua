-----------------------------------
-- ID: 5164
-- Item: jar_of_ground_wasabi
-- Food Effect: 5Min, All Races
-----------------------------------
-- Strength -1
-- Dexterity -1
-- Agility -1
-- Vitality -1
-- Intelligence -1
-- Mind -1
-- Charisma -1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5164)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.STR, -1)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.AGI, -1)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.INT, -1)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.CHR, -1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.STR, -1)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.AGI, -1)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.INT, -1)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.CHR, -1)
end

return itemObject
