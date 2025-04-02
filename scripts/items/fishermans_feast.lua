-----------------------------------
-- ID: 6381
-- Item: Fisherman's_Feast
-- Food Effect: 30Min, All Races
-----------------------------------
--  Fishing skill gain rate+5%
--  https://ffxiclopedia.fandom.com/wiki/Fisherman's_Feast
--  https://www.bg-wiki.com/ffxi/Fisherman%27s_Feast
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.foodOnItemCheck(target, invaderXim.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.FOOD, 0, 0, 1800, 6381)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FISHING_SKILL_GAIN, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FISHING_SKILL_GAIN, 5)
end

return itemObject
