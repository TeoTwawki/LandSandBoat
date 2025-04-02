-----------------------------------
-- ID: 15451
-- Item: Culinarian's Belt
-- Enchantment: Synthesis image support
-- 8Min, All Races
-----------------------------------
-- Enchantment: Synthesis image support
-- Duration: 8Min
-- Alchemy Skill +3
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:hasStatusEffect(invaderXim.effect.COOKING_IMAGERY) then
        result = 243
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(invaderXim.effect.COOKING_IMAGERY, 3, 0, 480)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.COOK, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.COOK, 1)
end

return itemObject
