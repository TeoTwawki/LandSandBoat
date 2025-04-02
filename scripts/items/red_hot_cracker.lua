-----------------------------------
-- ID: 4281
-- Item: red_hot_cracker
-- Food Effect: 3Min, All Races
-----------------------------------
-- HP Recovered While Healing 9
-- Beast Killer 12
-- Resist Sleep 12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4281)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 9)
    target:addMod(invaderXim.mod.BEAST_KILLER, 12)
    target:addMod(invaderXim.mod.SLEEPRES, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 9)
    target:delMod(invaderXim.mod.BEAST_KILLER, 12)
    target:delMod(invaderXim.mod.SLEEPRES, 12)
end

return itemObject
