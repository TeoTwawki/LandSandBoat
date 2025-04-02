-----------------------------------
-- ID: 15861
-- Item: deductive_brocade_obi
-- Item Effect: MND+10
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENCHANTMENT, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DEDUCTIVE_BROCADE_OBI) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENCHANTMENT, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DEDUCTIVE_BROCADE_OBI)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.DEDUCTIVE_BROCADE_OBI) then
        target:addStatusEffect(invaderXim.effect.MND_BOOST, 10, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.DEDUCTIVE_BROCADE_OBI)
    end
end

return itemObject
