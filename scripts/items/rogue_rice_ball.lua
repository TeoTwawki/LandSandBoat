-----------------------------------
-- ID: 4604
-- Item: Rogue Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +12
-- Vit +3
-- hHP +2
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Def +50
-- Beast Killer (guesstimated 5%)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4604)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 12)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.HPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 12)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.HPHEAL, 2)
end

return itemObject
