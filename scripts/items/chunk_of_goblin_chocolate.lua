-----------------------------------
-- ID: 4495
-- Item: chunk_of_goblin_chocolate
-- Food Effect: 3Min, All Races
-----------------------------------
-- Health Regen While Healing 5
-- Lizard Killer 10
-- Petrify resistance +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4495)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.LIZARD_KILLER, 5)
    target:addMod(invaderXim.mod.PETRIFYRES, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.LIZARD_KILLER, 5)
    target:delMod(invaderXim.mod.PETRIFYRES, 5)
end

return itemObject
