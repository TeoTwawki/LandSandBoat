-----------------------------------
-- ID: 15269
-- Item: eldritch_horn_hairpin
-- Item Effect: INT+3 MND+3
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ELDRITCH_HORN_HAIRPIN) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ELDRITCH_HORN_HAIRPIN)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.ELDRITCH_HORN_HAIRPIN) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.ELDRITCH_HORN_HAIRPIN)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, 3)
    target:addMod(invaderXim.mod.MND, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, 3)
    target:delMod(invaderXim.mod.MND, 3)
end

return itemObject
