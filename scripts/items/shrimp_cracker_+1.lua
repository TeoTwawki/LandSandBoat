-----------------------------------
-- ID: 5636
-- Item: shrimp_cracker_+1
-- Food Effect: 5Min, All Races
-----------------------------------
-- Vitality 2
-- Defense +10
-- Amorph Killer 12
-- Resist Virus 12
-- HP Recovered While Healing 9
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5636)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.DEF, 10)
    target:addMod(invaderXim.mod.AMORPH_KILLER, 12)
    target:addMod(invaderXim.mod.VIRUSRES, 12)
    target:addMod(invaderXim.mod.HPHEAL, 9)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.DEF, 10)
    target:delMod(invaderXim.mod.AMORPH_KILLER, 12)
    target:delMod(invaderXim.mod.VIRUSRES, 12)
    target:delMod(invaderXim.mod.HPHEAL, 9)
end

return itemObject
