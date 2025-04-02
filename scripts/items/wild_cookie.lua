-----------------------------------
-- ID: 4577
-- Item: wild_cookie
-- Food Effect: 5Min, All Races
-----------------------------------
-- Aquan killer +12
-- Silence resistance +12
-- MP recovered while healing +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 4577)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AQUAN_KILLER, 12)
    target:addMod(invaderXim.mod.SILENCERES, 12)
    target:addMod(invaderXim.mod.MPHEAL, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AQUAN_KILLER, 12)
    target:delMod(invaderXim.mod.SILENCERES, 12)
    target:delMod(invaderXim.mod.MPHEAL, 5)
end

return itemObject
