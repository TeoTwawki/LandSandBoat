-----------------------------------
-- ID: 5704
-- Item: anglers_cassoulet
-- Food Effect: 30, All Races
-----------------------------------
-- VIT -1
-- AGI +5
-- Ranged Accuracy +1
-- Regen +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5704)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.REGEN, 1)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.RACC, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.REGEN, 1)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.RACC, 5)
end

return itemObject
