-----------------------------------
-- ID: 18067
-- Equip: Keen Zaghnal
-- Enchantment: Accuracy +3
-- Enchantment will wear off if weapon is unequipped.
-- Effect lasts for 30 minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ACCURACY_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.KEEN_ZAGHNAL) ~= nil then
        target:delStatusEffect(invaderXim.effect.ACCURACY_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.KEEN_ZAGHNAL)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.KEEN_ZAGHNAL) then
        target:addStatusEffect(invaderXim.effect.ACCURACY_BOOST, 3, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.KEEN_ZAGHNAL)
    end
end

return itemObject
