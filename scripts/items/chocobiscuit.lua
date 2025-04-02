-----------------------------------
-- ID: 5934
-- Item: Chocobiscuit
-- Food Effect: 3Min, All Races
-----------------------------------
-- Magic Regen While Healing 3
-- Charisma 3
-- Evasion 2
-- Aquan Killer 10
-- Silence Resist 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5934)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MPHEAL, 3)
    target:addMod(invaderXim.mod.CHR, 3)
    target:addMod(invaderXim.mod.EVA, 2)
    target:addMod(invaderXim.mod.AQUAN_KILLER, 10)
    target:addMod(invaderXim.mod.SILENCERES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MPHEAL, 3)
    target:delMod(invaderXim.mod.CHR, 3)
    target:delMod(invaderXim.mod.EVA, 2)
    target:delMod(invaderXim.mod.AQUAN_KILLER, 10)
    target:delMod(invaderXim.mod.SILENCERES, 10)
end

return itemObject
