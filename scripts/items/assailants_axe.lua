-----------------------------------
-- ID: 18488
-- Item: assailants_axe
-- Item Effect: Acc +3
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASSAILANTS_AXE) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASSAILANTS_AXE)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.ASSAILANTS_AXE) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ASSAILANTS_AXE)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ACC, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ACC, 3)
end

return itemObject
