-----------------------------------
-- ID: 18216
-- Item: twicer
-- Item Effect: DOUBLE_ATTACK 100%
-- Duration: 30 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TWICER) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TWICER)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.TWICER) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 30, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.TWICER)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DOUBLE_ATTACK, 100)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DOUBLE_ATTACK, 100)
end

return itemObject
