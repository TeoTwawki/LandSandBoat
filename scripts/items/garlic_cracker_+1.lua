-----------------------------------
-- ID: 4280
-- Item: garlic_cracker_+1
-- Food Effect: 5Min, All Races
-----------------------------------
-- HP recovered while healing +8
-- Undead Killer +12
-- Blind Resist +12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4280)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 8)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, 12)
    target:addMod(invaderXim.mod.BLINDRES, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 8)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, 12)
    target:delMod(invaderXim.mod.BLINDRES, 12)
end

return itemObject
