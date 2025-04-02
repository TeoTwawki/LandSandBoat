-----------------------------------
-- ID: 4277
-- Item: Tonosama Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +15
-- Dex +3
-- Vit +3
-- Chr +3
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +50
-- Def +30
-- Double Attack +1%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 4277)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 15)
    target:addMod(invaderXim.mod.DEX, 3)
    target:addMod(invaderXim.mod.VIT, 3)
    target:addMod(invaderXim.mod.CHR, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 15)
    target:delMod(invaderXim.mod.DEX, 3)
    target:delMod(invaderXim.mod.VIT, 3)
    target:delMod(invaderXim.mod.CHR, 3)
end

return itemObject
