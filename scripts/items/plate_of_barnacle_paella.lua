-----------------------------------
-- ID: 5974
-- Item: Plate of Barnacle Paella
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- HP 40
-- Vitality 5
-- Mind -1
-- Charisma -1
-- Defense % 25 Cap 150
-- Undead Killer 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5974)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 40)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.CHR, -1)
    target:addMod(invaderXim.mod.FOOD_DEFP, 25)
    target:addMod(invaderXim.mod.FOOD_DEF_CAP, 150)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 40)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.CHR, -1)
    target:delMod(invaderXim.mod.FOOD_DEFP, 25)
    target:delMod(invaderXim.mod.FOOD_DEF_CAP, 150)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

return itemObject
