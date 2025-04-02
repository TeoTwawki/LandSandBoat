-----------------------------------
-- ID: 5582
-- Item: plate_of_patlican_salata
-- Food Effect: 180Min, All Races
-----------------------------------
-- Agility 4
-- Vitality -1
-- Evasion +6
-- hHP +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 5582)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.EVA, 6)
    target:addMod(invaderXim.mod.HPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.EVA, 6)
    target:delMod(invaderXim.mod.HPHEAL, 2)
end

return itemObject
