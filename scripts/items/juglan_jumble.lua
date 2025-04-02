-----------------------------------
-- ID: 5923
-- Item: Juglan Jumble
-- Food Effect: 5 Min, All Races
-----------------------------------
-- HP Healing 5
-- MP Healing 8
-- Bird Killer 12
-- Resist Paralyze 12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 300, 5923)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPHEAL, 5)
    target:addMod(invaderXim.mod.MPHEAL, 8)
    target:addMod(invaderXim.mod.BIRD_KILLER, 12)
    target:addMod(invaderXim.mod.PARALYZERES, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPHEAL, 5)
    target:delMod(invaderXim.mod.MPHEAL, 8)
    target:delMod(invaderXim.mod.BIRD_KILLER, 12)
    target:delMod(invaderXim.mod.PARALYZERES, 12)
end

return itemObject
