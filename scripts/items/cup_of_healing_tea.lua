-----------------------------------
-- ID: 4286
-- Item: cup_of_healing_tea
-- Food Effect: 240Min, All Races
-----------------------------------
-- Magic 10
-- Vitality -1
-- Charisma 3
-- Magic Regen While Healing 2
-- Sleep resistance -40
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 14400, 4286)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_MP, 10)
    target:addMod(invaderXim.mod.VIT, -1)
    target:addMod(invaderXim.mod.CHR, 3)
    target:addMod(invaderXim.mod.MPHEAL, 2)
    target:addMod(invaderXim.mod.SLEEPRES, -40)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_MP, 10)
    target:delMod(invaderXim.mod.VIT, -1)
    target:delMod(invaderXim.mod.CHR, 3)
    target:delMod(invaderXim.mod.MPHEAL, 2)
    target:delMod(invaderXim.mod.SLEEPRES, -40)
end

return itemObject
