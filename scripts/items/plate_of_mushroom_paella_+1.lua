-----------------------------------
-- ID: 5971
-- Item: Plate of Mushroom Paella +1
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- HP 43
-- Mind 6
-- Magic Accuracy 6
-- Undead Killer 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5971)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 45)
    target:addMod(invaderXim.mod.MND, 6)
    target:addMod(invaderXim.mod.MACC, 6)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 45)
    target:delMod(invaderXim.mod.MND, 6)
    target:delMod(invaderXim.mod.MACC, 6)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 6)
end

return itemObject
