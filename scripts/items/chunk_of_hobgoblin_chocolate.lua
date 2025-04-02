-----------------------------------
-- ID: 4324
-- Item: chunk_of_hobgoblin_chocolate
-- Food Effect: 5Min, All Races
-----------------------------------
-- Health Regen While Healing 7
-- Lizard Killer 12
-- Petrify Resist 12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4324)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 7)
    target:addMod(invaderXim.mod.LIZARD_KILLER, 12)
    target:addMod(invaderXim.mod.PETRIFYRES, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 7)
    target:delMod(invaderXim.mod.LIZARD_KILLER, 12)
    target:delMod(invaderXim.mod.PETRIFYRES, 12)
end

return itemObject
