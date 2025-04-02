-----------------------------------
-- ID: 14789
-- Item: Naruko Earring
-- Item Effect: Enmity +10
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENMITY_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.NARUKO_EARRING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENMITY_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.NARUKO_EARRING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.NARUKO_EARRING) then
        target:addStatusEffect(invaderXim.effect.ENMITY_BOOST, 10, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.NARUKO_EARRING)
    end
end

return itemObject
