-----------------------------------
-- ID: 5942
-- Item: Piece of Cascade Candy
-- Food Effect: 30Min, All Races
-----------------------------------
-- Mind +4
-- Charisma +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5942)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MND, 4)
    target:addMod(invaderXim.mod.CHR, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MND, 4)
    target:delMod(invaderXim.mod.CHR, 4)
end

return itemObject
