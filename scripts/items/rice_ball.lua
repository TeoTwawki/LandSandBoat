-----------------------------------
-- ID: 4405
-- Item: Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP 10,
-- Vit +2
-- Dex -1
-- hHP +1
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Def +50
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4405)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.DEX, -1)
    target:addMod(invaderXim.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.DEX, -1)
    target:delMod(invaderXim.mod.HPHEAL, 1)
end

return itemObject
