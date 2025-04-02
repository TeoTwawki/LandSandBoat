-----------------------------------
-- ID: 4467
-- Item: garlic_cracker
-- Food Effect: 3Min, All Races
-----------------------------------
-- HP Regen While Healing 6
-- Undead Killer 10
-- Blind Resist 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4467)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 6)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 10)
    target:addMod(invaderXim.mod.BLINDRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 6)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 10)
    target:delMod(invaderXim.mod.BLINDRES, 10)
end

return itemObject
