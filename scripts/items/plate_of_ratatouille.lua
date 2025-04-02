-----------------------------------
-- ID: 5731
-- Item: plate_of_ratatouille
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- Agility 5
-- Evasion 5
-- HP recovered while healing 2
-- MP recovered while healing 2
-- Undead Killer 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5731)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.EVA, 5)
    target:addMod(invaderXim.mod.HPHEAL, 2)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.EVA, 5)
    target:delMod(invaderXim.mod.HPHEAL, 2)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 5)
end

return itemObject
