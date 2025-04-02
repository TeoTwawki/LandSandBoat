-----------------------------------
-- ID: 17954
-- Item: jolt_axe
-- Item Effect: Attack +3
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.JOLT_AXE) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.JOLT_AXE)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.JOLT_AXE) then
        target:addStatusEffect(invaderXim.effect.ATTACK_BOOST, 3, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.JOLT_AXE)
    end
end

return itemObject
