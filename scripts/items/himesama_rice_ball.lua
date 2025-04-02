-----------------------------------
-- ID: 5928
-- Item: Himesama Rice Ball
-- Food Effect: 30 Mins, All Races
-----------------------------------
-- HP +25
-- Dexterity +4
-- Vitality +4
-- Character +4
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Attack +60
-- Defense +40
-- Triple Attack +1%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 5928)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 25)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.CHR, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 25)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.CHR, 4)
end

return itemObject
