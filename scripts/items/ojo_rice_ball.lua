-----------------------------------
-- ID: 5929
-- Item: Ojo Rice Ball
-- Food Effect: 60 Mins, All Races
-----------------------------------
-- HP +50
-- Dexterity +5
-- Vitality +5
-- Character +5
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Attack +60
-- Defense +40
-- Triple Attack +2%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5929)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 50)
    target:addMod(invaderXim.mod.DEX, 5)
    target:addMod(invaderXim.mod.VIT, 5)
    target:addMod(invaderXim.mod.CHR, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 50)
    target:delMod(invaderXim.mod.DEX, 5)
    target:delMod(invaderXim.mod.VIT, 5)
    target:delMod(invaderXim.mod.CHR, 5)
end

return itemObject
