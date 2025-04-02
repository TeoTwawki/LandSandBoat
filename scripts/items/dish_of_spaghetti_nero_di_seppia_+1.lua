-----------------------------------
-- ID: 5202
-- Item: Dish of Spaghetti Nero Di Seppia +1
-- Food Effect: 60 Mins, All Races
-----------------------------------
-- HP % 17 (cap 140)
-- Dexterity 3
-- Vitality 2
-- Agility -1
-- Mind -2
-- Charisma -1
-- Double Attack 1
-- Store TP 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5202)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HPP, 17)
    target:addMod(invaderXim.mod.FOOD_HP_CAP, 140)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.AGI, -1)
    target:addMod(invaderXim.mod.MND, -2)
    target:addMod(invaderXim.mod.CHR, -1)
    target:addMod(invaderXim.mod.DOUBLE_ATTACK, 1)
    target:addMod(invaderXim.mod.STORETP, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HPP, 17)
    target:delMod(invaderXim.mod.FOOD_HP_CAP, 140)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.AGI, -1)
    target:delMod(invaderXim.mod.MND, -2)
    target:delMod(invaderXim.mod.CHR, -1)
    target:delMod(invaderXim.mod.DOUBLE_ATTACK, 1)
    target:delMod(invaderXim.mod.STORETP, 6)
end

return itemObject
