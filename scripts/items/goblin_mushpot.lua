-----------------------------------
-- ID: 4543
-- Item: goblin_mushpot
-- Food Effect: 180Min, All Races
-----------------------------------
-- Mind 10
-- Charisma -5
-- Poison Resist 4
-- Blind Resist 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 10800, 4543)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MND, 10)
    target:addMod(invaderXim.mod.CHR, -5)
    target:addMod(invaderXim.mod.POISONRES, 4)
    target:addMod(invaderXim.mod.BLINDRES, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MND, 10)
    target:delMod(invaderXim.mod.CHR, -5)
    target:delMod(invaderXim.mod.POISONRES, 4)
    target:delMod(invaderXim.mod.BLINDRES, 4)
end

return itemObject
