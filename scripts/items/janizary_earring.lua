-----------------------------------
-- ID: 14785
-- Item: Janizary Earring
-- Item Effect: Defence +32
-- Duration 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.JANIZARY_EARRING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.JANIZARY_EARRING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.JANIZARY_EARRING) then
        target:addStatusEffect(invaderXim.effect.DEFENSE_BOOST, 32, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.JANIZARY_EARRING)
    end
end

return itemObject
