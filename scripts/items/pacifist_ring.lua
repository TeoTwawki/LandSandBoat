-----------------------------------
-- ID: 14680
-- Item: Pacifist Ring
-- Item Effect: Enmity -12
-- Duration: 3 Minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.ENMITY_DOWN, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PACIFIST_RING) ~= nil then
        target:delStatusEffect(invaderXim.effect.ENMITY_DOWN, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PACIFIST_RING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.PACIFIST_RING) then
        target:addStatusEffect(invaderXim.effect.ENMITY_DOWN, 12, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.PACIFIST_RING)
    end
end

return itemObject
