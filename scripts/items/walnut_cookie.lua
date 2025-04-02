-----------------------------------
-- ID: 5922
-- Item: Walnut Cookie
-- Food Effect: 3 Min, All Races
-----------------------------------
-- HP Healing 3
-- MP Healing 6
-- Bird Killer 10
-- Resist Paralyze 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 5922)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 3)
    target:addMod(invaderXim.mod.MPHEAL, 6)
    target:addMod(invaderXim.mod.BIRD_KILLER, 10)
    target:addMod(invaderXim.mod.PARALYZERES, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 3)
    target:delMod(invaderXim.mod.MPHEAL, 6)
    target:delMod(invaderXim.mod.BIRD_KILLER, 10)
    target:delMod(invaderXim.mod.PARALYZERES, 10)
end

return itemObject
