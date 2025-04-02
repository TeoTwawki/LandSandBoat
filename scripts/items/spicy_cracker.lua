-----------------------------------
-- ID: 4466
-- Item: spicy_cracker
-- Food Effect: 3Min, All Races
-----------------------------------
-- HP Recovered While Healing 7
-- Beast Killer +10
-- Resist Sleep +10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4466)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 7)
    target:addMod(invaderXim.mod.BEAST_KILLER, 10)
    target:addMod(invaderXim.mod.SLEEPRES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 7)
    target:delMod(invaderXim.mod.BEAST_KILLER, 10)
    target:delMod(invaderXim.mod.SLEEPRES, 10)
end

return itemObject
