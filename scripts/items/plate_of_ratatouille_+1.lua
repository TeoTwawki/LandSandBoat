-----------------------------------
-- ID: 5732
-- Item: plate_of_ratatouille_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- Agility 6
-- Evasion 10
-- HP recovered while healing 3
-- MP recovered while healing 3
-- Undead Killer 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5732)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 6)
    target:addMod(invaderXim.mod.EVA, 10)
    target:addMod(invaderXim.mod.HPHEAL, 3)
    target:addMod(invaderXim.mod.MPHEAL, 3)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 6)
    target:delMod(invaderXim.mod.EVA, 10)
    target:delMod(invaderXim.mod.HPHEAL, 3)
    target:delMod(invaderXim.mod.MPHEAL, 3)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 10)
end

return itemObject
