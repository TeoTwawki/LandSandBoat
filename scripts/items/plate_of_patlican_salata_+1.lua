-----------------------------------
-- ID: 5583
-- Item: plate_of_patlican_salata_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- Agility 5
-- Vitality -2
-- Evasion +7
-- hHP +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5583)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 5)
    target:addMod(invaderXim.mod.VIT, -2)
    target:addMod(invaderXim.mod.EVA, 7)
    target:addMod(invaderXim.mod.HPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 5)
    target:delMod(invaderXim.mod.VIT, -2)
    target:delMod(invaderXim.mod.EVA, 7)
    target:delMod(invaderXim.mod.HPHEAL, 3)
end

return itemObject
