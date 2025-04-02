-----------------------------------
-- ID: 4510
-- Item: Acorn Cookie
-- Food Effect: 3Min, All Races
-----------------------------------
-- Aquan killer +10
-- Silence resistance +10
-- MP recovered while healing +3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 180, 4510)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AQUAN_KILLER, 10)
    target:addMod(invaderXim.mod.SILENCERES, 10)
    target:addMod(invaderXim.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AQUAN_KILLER, 10)
    target:delMod(invaderXim.mod.SILENCERES, 10)
    target:delMod(invaderXim.mod.MPHEAL, 3)
end

return itemObject
