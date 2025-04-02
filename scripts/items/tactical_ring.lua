-----------------------------------
-- ID: 14679
-- Item: Tactical Ring
-- Item Effect: Regain 20
-- Duration: 2 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TACTICAL_RING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TACTICAL_RING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.TACTICAL_RING) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 120, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TACTICAL_RING)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.REGAIN, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.REGAIN, 20)
end

return itemObject
