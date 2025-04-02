-----------------------------------
-- ID: 4590
-- Item: Salmon Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +10
-- Dex +2
-- Vit +2
-- Mnd -1
-- hHP +1
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +40
-- Def +40
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4590)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 10)
    target:addMod(invaderXim.mod.DEX, 2)
    target:addMod(invaderXim.mod.VIT, 2)
    target:addMod(invaderXim.mod.MND, -1)
    target:addMod(invaderXim.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 10)
    target:delMod(invaderXim.mod.DEX, 2)
    target:delMod(invaderXim.mod.VIT, 2)
    target:delMod(invaderXim.mod.MND, -1)
    target:delMod(invaderXim.mod.HPHEAL, 1)
end

return itemObject
