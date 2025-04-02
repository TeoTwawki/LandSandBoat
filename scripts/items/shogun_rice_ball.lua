-----------------------------------
-- ID: 4278
-- Item: Shogun Rice Ball
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP +20
-- Dex +4
-- Vit +4
-- Chr +4
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +50
-- Def +30
-- Double Attack +5%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 4278)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 20)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.CHR, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 20)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.CHR, 4)
end

return itemObject
