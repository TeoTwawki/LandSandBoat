-----------------------------------
-- ID: 15868
-- Item: czars_belt
-- Item Effect: VIT +10
-- Duration: 60 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.CZARS_BELT) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.CZARS_BELT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.CZARS_BELT) then
        target:addStatusEffect(invaderXim.effect.ENCHANTMENT, 0, 0, 60, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.CZARS_BELT)
    end
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.VIT, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.VIT, 10)
end

return itemObject
