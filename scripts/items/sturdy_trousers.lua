-----------------------------------
-- ID: 15610
-- Item: sturdy_trousers
-- Item Effect: HP +10
-- Duration: 30 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.MAX_HP_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.STURDY_TROUSERS) ~= nil then
        target:delStatusEffect(invaderXim.effect.MAX_HP_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.STURDY_TROUSERS)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.STURDY_TROUSERS) then
        target:addStatusEffect(invaderXim.effect.MAX_HP_BOOST, 10, 0, 1800, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.STURDY_TROUSERS)
    end
end

return itemObject
