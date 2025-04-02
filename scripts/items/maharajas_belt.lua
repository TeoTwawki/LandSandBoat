-----------------------------------
-- ID: 15870
-- Item: maharajas_belt
-- Item Effect: AGI +10
-- Duration: 60 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MAHARAJAS_BELT) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MAHARAJAS_BELT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.MAHARAJAS_BELT) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 60, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MAHARAJAS_BELT)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.AGI, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.AGI, 10)
end

return itemObject
