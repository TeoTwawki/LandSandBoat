-----------------------------------
-- ID: 15449
-- Item: Boneworker's belt
-- Enchantment: Synthesis image support
-- 8Min, All Races
-----------------------------------
-- Enchantment: Synthesis image support
-- Duration: 8Min
-- Bonecraft Skill +3
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:hasStatusEffect(invaderXim.effect.BONECRAFT_IMAGERY) then
        result = 241
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.BONECRAFT_IMAGERY, 3, 0, 480)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.BONE, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.BONE, 1)
end

return itemObject
