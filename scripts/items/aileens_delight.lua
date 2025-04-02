-----------------------------------
-- ID: 5674
-- Item: Aileen's Delight
-- Food Effect: 60 Min, All Races
-----------------------------------
-- HP +50
-- MP +50
-- STR +4
-- DEX +4
-- VIT +4
-- AGI +4
-- INT +4
-- MND +4
-- CHR +4
-- MP recovered while healing +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 3600, 5674)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FOOD_HP, 50)
    target:addMod(invaderXim.mod.FOOD_MP, 50)
    target:addMod(invaderXim.mod.STR, 4)
    target:addMod(invaderXim.mod.DEX, 4)
    target:addMod(invaderXim.mod.VIT, 4)
    target:addMod(invaderXim.mod.AGI, 4)
    target:addMod(invaderXim.mod.INT, 4)
    target:addMod(invaderXim.mod.MND, 4)
    target:addMod(invaderXim.mod.CHR, 4)
    target:addMod(invaderXim.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FOOD_HP, 50)
    target:delMod(invaderXim.mod.FOOD_MP, 50)
    target:delMod(invaderXim.mod.STR, 4)
    target:delMod(invaderXim.mod.DEX, 4)
    target:delMod(invaderXim.mod.VIT, 4)
    target:delMod(invaderXim.mod.AGI, 4)
    target:delMod(invaderXim.mod.INT, 4)
    target:delMod(invaderXim.mod.MND, 4)
    target:delMod(invaderXim.mod.CHR, 4)
    target:delMod(invaderXim.mod.MPHEAL, 2)
end

return itemObject
