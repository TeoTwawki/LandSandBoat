-----------------------------------
-- ID: 5180
-- Item: bowl_of_sophic_stew
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- Dexterity 6
-- Intelligence 6
-- Mind 6
-- HP Recovered While Healing 3
-- MP Recovered While Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 5180)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEX, 6)
    target:addMod(invaderXim.mod.INT, 6)
    target:addMod(invaderXim.mod.MND, 6)
    target:addMod(invaderXim.mod.HPHEAL, 3)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEX, 6)
    target:delMod(invaderXim.mod.INT, 6)
    target:delMod(invaderXim.mod.MND, 6)
    target:delMod(invaderXim.mod.HPHEAL, 3)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
