-----------------------------------
-- ID: 5908
-- Item: Butterpear
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility +4
-- Vitality +1
-- Resist Amnesia +20
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5908)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.VIT, 1)
    target:addMod(invaderXim.mod.AMNESIARES, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.VIT, 1)
    target:delMod(invaderXim.mod.AMNESIARES, 20)
end

return itemObject
