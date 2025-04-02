-----------------------------------
-- ID: 15447
-- Item: Weaver's Belt
-- Enchantment: Synthesis image support
-- 8Min, All Races
-----------------------------------
-- Enchantment: Synthesis image support
-- Duration: 8Min
-- Clothcraft Skill +3
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:hasStatusEffect(invaderXim.effect.CLOTHCRAFT_IMAGERY) then
        result = 239
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.CLOTHCRAFT_IMAGERY, 3, 0, 480)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CLOTH, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CLOTH, 1)
end

return itemObject
